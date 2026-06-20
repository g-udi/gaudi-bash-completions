# shellcheck shell=bash

cite about-completion
about-completion 'Helm (Kubernetes Package Manager) completions'

if _command_exists helm && helm_completion=$(helm completion bash 2> /dev/null); then
  eval "$helm_completion"
fi
unset helm_completion
