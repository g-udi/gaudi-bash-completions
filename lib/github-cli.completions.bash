# shellcheck shell=bash
cite about-completion
about-completion "GitHub CLI completion"

# Make sure gh is installed
_binary_exists gh || return 0

# Don't handle completion if it's already managed
complete -p gh &> /dev/null && return 0

if gh_completion=$(gh completion --shell=bash 2> /dev/null); then
  eval "$gh_completion"
fi
unset gh_completion
