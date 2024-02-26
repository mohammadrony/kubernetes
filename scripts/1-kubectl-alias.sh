#!/bin/bash
alias kshell='kubectl run -it shell --image giantswarm/tiny-tools --restart Never --rm -- sh'

kx () {
  local pod=($(kubectl get pods --all-namespaces -owide | fzf | awk '{print $1, $2}'))
  local cmd=${@:-"bash"}

  echo kubectl exec -it --namespace $pod[1] $pod[2] $cmd
  kubectl exec -it --namespace $pod[1] $pod[2] $cmd
}

kl () {
  local pod=($(kubectl get pods --all-namespaces -owide | fzf | awk '{print $1, $2}'))
  local attr=${@:-""}

  echo kubectl logs -f $attr --namespace $pod[1] $pod[2]
  kubectl logs -f $attr --namespace $pod[1] $pod[2]
}
