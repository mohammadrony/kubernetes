# Migration

## Calico to Cilium

[Migrating from Calico - Isovalent](https://isovalent.com/labs/cilium-migrating-from-calico/)

Preparation

```bash
kubectl get installations.operator.tigera.io default \
  -o jsonpath='{.spec.calicoNetwork.ipPools[*].cidr}{"\n"}'
# 192.168.0.0/16
```

```bash
kubectl get installations.operator.tigera.io default \
  -o jsonpath='{.spec.calicoNetwork.ipPools[*].encapsulation}{"\n"}'
# VXLANCrossSubnet
```

Generate helm values

```bash
cat values-migration.yaml
```

```bash
cilium install \
  --helm-values values-migration.yaml \
  --dry-run-helm-values > values-initial.yaml
```

Prevent calico from using cilium interface

```bash
kubectl get installations.operator.tigera.io default \
  -o jsonpath='{.spec.calicoNetwork.nodeAddressAutodetectionV4}{"\n"}'
# {"firstFound":true}
```

```bash
kubectl patch installations.operator.tigera.io default --type=merge \
  --patch '{"spec": {"calicoNetwork": {"nodeAddressAutodetectionV4": {"firstFound": false, "kubernetes": "NodeInternalIP"}}}}'
```

```bash
kubectl get installations.operator.tigera.io default \
  -o jsonpath='{.spec.calicoNetwork.nodeAddressAutodetectionV4}{"\n"}'
# {"firstFound":false,"kubernetes":"NodeInternalIP"}
```

Install Cilium

```bash
helm repo add cilium https://helm.cilium.io/
helm upgrade --install cilium cilium/cilium --namespace kube-system \
  --values values-initial.yaml
```

Check CNI configuration

```bash
sudo ls /etc/cni/net.d/
```

```bash
kubectl apply --server-side -f ciliumnodeconfig.yaml
```

Currently nodes doesn't have `io.cilium.migration/cilium-default: "true"` condition

```bash
kubectl get no --show-labels
```

### Start Migrating

#### First worker node

Cordon and drain node

```bash
NODE="worker"
kubectl cordon $NODE
kubectl drain $NODE --ignore-daemonsets
kubectl get pods -o wide --field-selector spec.nodeName=$NODE
```

Label and restart

```bash
kubectl label node $NODE --overwrite "io.cilium.migration/cilium-default=true"
```

```bash
kubectl -n kube-system delete pod --field-selector spec.nodeName=$NODE -l k8s-app=cilium
kubectl -n kube-system rollout status ds/cilium -w
```

Delete daemonset pods

```bash
kubectl get pods --field-selector spec.nodeName=$NODE -o wide
kubectl delete pods --field-selector spec.nodeName=$NODE
kubectl get pods --field-selector spec.nodeName=$NODE -o wide
```

Get cilium node CIDR

```bash
kubectl get ciliumnode $NODE -o jsonpath='{.spec.ipam.podCIDRs[0]}{"\n"}'
```

Uncordon worker node

```bash
kubectl uncordon $NODE
```

#### All worker node

```bash
for i in $(seq 2 4); do
  node="worker${i}"
  echo "Migrating node ${node}"
  kubectl drain $node --ignore-daemonsets
  kubectl label node $node --overwrite "io.cilium.migration/cilium-default=true"
  kubectl -n kube-system delete pod --field-selector spec.nodeName=$node -l k8s-app=cilium
  kubectl -n kube-system rollout status ds/cilium -w
  kubectl uncordon $node
done
```

Check cilium status

```bash
cilium status --wait
```

Restart daemonset pods in all node

```bash
for i in $(seq 2 4); do
  node="worker${i}"
  echo "Restarting pods in ${node}"
  kubectl delete pods --field-selector spec.nodeName=$node
  kubectl get pods --field-selector spec.nodeName=$node -o wide
done
```

#### Control plane

Restart cilium pods

```bash
NODE="control-plane"
kubectl drain $NODE --ignore-daemonsets
kubectl label node $NODE --overwrite "io.cilium.migration/cilium-default=true"
kubectl -n kube-system delete pod --field-selector spec.nodeName=$NODE -l k8s-app=cilium
kubectl -n kube-system rollout status ds/cilium -w
kubectl uncordon $NODE
```

Restart other daemonset

```bash
kubectl rollout restart daemonset <daemonset>
kubectl rollout status daemonset <daemonset>
```

Restart calico pods

```bash
kubectl rollout restart daemonset -n calico-system csi-node-driver
kubectl rollout status daemonset -n calico-system csi-node-driver
```

Check cilium status

```bash
cilium status --wait
```

### Finalize Setup

```bash
cilium install \
  --helm-values values-initial.yaml \
  --helm-set operator.unmanagedPodWatcher.restart=true \
  --helm-set cni.customConf=false \
  --helm-set policyEnforcementMode=default \
  --dry-run-helm-values > values-final.yaml
```

```bash
diff -u --color values-initial.yaml values-final.yaml
```

Apply changes

```bash
helm upgrade --install --namespace kube-system cilium cilium/cilium \
  --values values-final.yaml
kubectl -n kube-system rollout restart daemonset cilium
```

Check cilium status

```bash
cilium status --wait
```

Remove CiliumNodeConfig resource

```bash
kubectl get -n kube-system ciliumnodeconfig cilium-default
kubectl delete -n kube-system ciliumnodeconfig cilium-default
```

Delete calico resources

```bash
version=$(kubectl get clusterinfo default -o yaml | yq .spec.calicoVersion)
kubectl delete --force -f https://raw.githubusercontent.com/projectcalico/calico/$version/manifests/tigera-operator.yaml
kubectl delete --force -f https://raw.githubusercontent.com/projectcalico/calico/$version/manifests/custom-resources.yaml
kubectl delete --force namespace calico-system
```

Restart worker nodes

```bash
for i in " " $(seq 2 4); do
  node="worker${i}"
  echo "Restarting node ${node}"
  ssh <kube>@<worker> "sudo reboot"
  sleep 60
  kubectl -n kube-system rollout status ds/cilium -w
done
```

Restart control plane

```bash
ssh <kube>@<controlplane> "sudo reboot"
sleep 60
kubectl -n kube-system rollout status ds/cilium -w
```

Check cilium status

```bash
cilium status --wait
```
