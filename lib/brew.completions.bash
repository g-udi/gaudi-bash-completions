# shellcheck shell=bash

cite about-completion priority
about-completion 'Brew completions'

# Load late to make sure `system` completion loads first
priority "375"

# Make sure brew is installed
_binary_exists brew || return 0

# The prefix comes from the environment when it is known (the brew plugin and
# `brew shellenv` set it); _homebrew-check asks brew once otherwise. BREW_PREFIX
# is still read when it is set.
_gaudi_brew_completion_prefix="${BREW_PREFIX:-${GAUDI_HOST_HOMEBREW_PREFIX:-${HOMEBREW_PREFIX:-}}}"
if [[ -z "$_gaudi_brew_completion_prefix" ]] && _homebrew-check; then
  _gaudi_brew_completion_prefix="${GAUDI_HOST_HOMEBREW_PREFIX:-}"
fi
if [[ -z "$_gaudi_brew_completion_prefix" ]]; then
  unset _gaudi_brew_completion_prefix
  return 0
fi

if [[ -r "$_gaudi_brew_completion_prefix"/etc/bash_completion.d/brew ]] ; then
  # shellcheck source=/dev/null
  source "$_gaudi_brew_completion_prefix"/etc/bash_completion.d/brew

elif [[ -r "$_gaudi_brew_completion_prefix"/Library/Contributions/brew_bash_completion.sh ]] ; then
  # shellcheck source=/dev/null
  source "$_gaudi_brew_completion_prefix"/Library/Contributions/brew_bash_completion.sh

elif [[ -f "$_gaudi_brew_completion_prefix"/completions/bash/brew ]] ; then
  # For the git-clone based installation, see here for more info:
  # https://github.com/Bash-it/bash-it/issues/1458
  # https://docs.brew.sh/Shell-Completion
  # shellcheck source=/dev/null
  source "$_gaudi_brew_completion_prefix"/completions/bash/brew
fi
unset _gaudi_brew_completion_prefix
