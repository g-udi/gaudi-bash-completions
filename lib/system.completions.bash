# shellcheck shell=bash

cite about-completion
about-completion 'Loads the systems Bash completion modules'

if [[ -r /etc/bash_completion ]] ; then
  # shellcheck disable=SC1091
  source /etc/bash_completion

# Some distribution makes use of a profile.d script to import completion.
elif [[ -r /etc/profile.d/bash_completion.sh ]] ; then
  # shellcheck disable=SC1091
  source /etc/profile.d/bash_completion.sh

fi

if [[ "$(uname -s)" == 'Darwin' ]] && _command_exists brew ; then
  BREW_PREFIX=${BREW_PREFIX:-$(brew --prefix)}

  # homebrew/versions/bash-completion2 (required for projects.completion.bash) is installed to this path
  if [[ -r "$BREW_PREFIX"/etc/profile.d/bash_completion.sh ]] ; then
    # shellcheck disable=SC1090
    source "$BREW_PREFIX"/etc/profile.d/bash_completion.sh
  fi
fi
