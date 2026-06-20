# shellcheck shell=bash

cite about-completion
about-completion 'Openshift bash completions'

if _command_exists oc && oc_completion=$(oc completion bash 2> /dev/null); then
  # shellcheck source=/dev/null
  source <(printf '%s\n' "$oc_completion")
fi
unset oc_completion
