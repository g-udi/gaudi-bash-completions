# shellcheck shell=bash

cite about-completion
about-completion 'NPM (Node Package Manager) completion'

# command -v: a function counts too (the nvm plugin's lazy-load stub is a
# function named npm). Nothing is run here: `npm completion` starts node, so it
# is left for the first TAB.
command -v npm > /dev/null 2>&1 || return 0

# Don't handle completion if it's already managed
complete -p npm &> /dev/null && return 0

# Loaded on the first TAB, so nothing forks at shell start
_gaudi_lazy_completion_npm() {
  local spec
  spec="$(complete -p npm 2> /dev/null)"
  if [[ "$spec" == *" -F ${FUNCNAME[0]} "* ]]; then
    complete -r npm
    eval "$(npm completion 2> /dev/null)"
    spec="$(complete -p npm 2> /dev/null)"
    # Completing npm itself: 124 makes bash retry with the completion just loaded
    [[ "${1:-}" == npm && -n "$spec" ]] && return 124
  fi
  # Reached through an alias of npm: hand over to the loaded completion function
  [[ "$spec" =~ -F[[:space:]]+([^[:space:]]+) ]] && "${BASH_REMATCH[1]}" "$@"
}
complete -o default -F _gaudi_lazy_completion_npm npm
