#!/bin/bash
alias kshell='kubectl run -it shell --image giantswarm/tiny-tools --restart Never --rm -- sh'

# kubectl exec
kx () {
  local pod=($(kubectl get pods --all-namespaces -owide | fzf | awk '{print $1, $2}'))
  local cmd=${@:-"bash"}

  echo kubectl exec -it --namespace $pod[1] $pod[2] $cmd
  kubectl exec -it --namespace $pod[1] $pod[2] $cmd
}

# kubectl logs
kl () {
  local pod=($(kubectl get pods --all-namespaces -owide | fzf | awk '{print $1, $2}'))
  local attr=${@:-""}

  echo kubectl logs -f $attr --namespace $pod[1] $pod[2]
  kubectl logs -f $attr --namespace $pod[1] $pod[2]
}

# kubectl describe
kd () {
  api_resources=$(kubectl api-resources --namespaced | sed -E 's/(.{40}).*/\1/;s/[A-Z ]+/\n/g' | sort -u)
  [ $# -eq 0 ] && x=$(echo ${api_resources} | fzf) || echo ${api_resources} | grep -xq $1

  if [ $? -eq 0 ]; then
    local obj=($(kubectl get $x --all-namespaces -owide | fzf | awk '{print $1, $2}'))
    echo kubectl describe $x --namespace $obj[1] $obj[2]
    kubectl describe $x --namespace $obj[1] $obj[2] | most
  else
    echo 'Try again.'
  fi
}

# kubectl edit
ked () {
  api_resources=$(kubectl api-resources --namespaced | sed -E 's/(.{40}).*/\1/;s/[A-Z ]+/\n/g' | sort -u)
  [ $# -eq 0 ] && x=$(echo ${api_resources} | fzf) || echo ${api_resources} | grep -xq $1

  if [ $? -eq 0 ]; then
    local obj=($(kubectl get $x --all-namespaces -owide | fzf | awk '{print $1, $2}'))
    echo kubectl edit $x --namespace $obj[1] $obj[2]
    kubectl edit $x --namespace $obj[1] $obj[2]
  else
    echo 'Try again.'
  fi
}
