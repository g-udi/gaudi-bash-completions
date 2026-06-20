
# shellcheck shell=bash

cite about-completion
about-completion 'Minikube (Local Kubernetes) completion'

if _command_exists minikube && minikube_completion=$(minikube completion bash 2> /dev/null); then
  eval "$minikube_completion"
fi
unset minikube_completion
