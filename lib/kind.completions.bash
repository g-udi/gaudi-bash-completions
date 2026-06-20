# shellcheck shell=bash
cite about-completion
about-completion "kind (Kubernetes IN Docker) completion"

# Make sure kind is installed
_command_exists kind || return 0

# Don't handle completion if it's already managed
complete -p kind &> /dev/null && return 0

if kind_completion=$(kind completion bash 2> /dev/null); then
  eval "$kind_completion"
fi
unset kind_completion
