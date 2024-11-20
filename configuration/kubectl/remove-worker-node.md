# Remove Worker Node

## Remove working node zero downtime

```bash
NODENAME=<name>

echo Mark the node as unschedulable $NODENAME
kubectl cordon $NODENAME

NAMESPACES=$(kubectl get pods --all-namespaces -o custom-columns=:metadata.namespace --field-selector spec.nodeName=$NODENAME | sort -u | sed -e "/^ *$/d")

for NAMESPACE in $NAMESPACES
do
    echo deployment restart for $NAMESPACE
    kubectl rollout restart deployment/name -n $NAMESPACE
done

for NAMESPACE in $NAMESPACES
do
    echo deployment status for $NAMESPACE
    kubectl rollout status deployment/name -n $NAMESPACE
done

kubectl drain $NODENAME --ignore-daemonsets --delete-local-data
```

```bash
kubectl delete node $NODENAME
```
