# shellcheck shell=bash

cite about-completion
about-completion 'Kubectl (Kubernetes CLI) completion'

if _command_exists kubectl && kubectl_completion=$(kubectl completion bash 2> /dev/null); then
  eval "$kubectl_completion"
fi
unset kubectl_completion
