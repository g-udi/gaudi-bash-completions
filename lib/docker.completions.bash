# shellcheck shell=bash

cite about-completion
about-completion 'Docker bash completions'

# Make sure docker is installed
_binary_exists docker || return 0

# Don't handle completion if it's already managed
complete -p docker &>/dev/null && return 0

# macOS (Docker Desktop), then Linux
for _gaudi_docker_completion in \
  '/Applications/Docker.app/Contents/Resources/etc/docker.bash-completion' \
  '/usr/share/bash-completion/completions/docker'; do
  if [[ -r "$_gaudi_docker_completion" ]] ; then
    # shellcheck source=/dev/null
    source "$_gaudi_docker_completion"
    break
  fi
done
unset _gaudi_docker_completion
