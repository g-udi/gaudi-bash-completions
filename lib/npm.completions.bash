# shellcheck shell=bash

cite about-completion
about-completion 'NPM (Node Package Manager) completion'

if _command_exists npm && npm_completion=$(npm completion 2> /dev/null); then
  eval "$npm_completion"
fi
unset npm_completion
