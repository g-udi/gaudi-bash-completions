# shellcheck shell=bash

cite about-completion
about-completion 'Enable Conda completions'

# Needs argcomplete's register-python-argcomplete
_binary_exists conda || return 0
_binary_exists register-python-argcomplete || return 0

# Don't handle completion if it's already managed
complete -p conda &> /dev/null && return 0

# Loaded on the first TAB, so no Python process is started at shell start
_gaudi_lazy_completion_conda() {
  local spec
  spec="$(complete -p conda 2> /dev/null)"
  if [[ "$spec" == *" -F ${FUNCNAME[0]} "* ]]; then
    complete -r conda
    eval "$(register-python-argcomplete conda 2> /dev/null)"
    spec="$(complete -p conda 2> /dev/null)"
    # Completing conda itself: 124 makes bash retry with the completion just loaded
    [[ "${1:-}" == conda && -n "$spec" ]] && return 124
  fi
  # Reached through an alias of conda: hand over to the loaded completion function
  [[ "$spec" =~ -F[[:space:]]+([^[:space:]]+) ]] && "${BASH_REMATCH[1]}" "$@"
}
complete -F _gaudi_lazy_completion_conda conda
