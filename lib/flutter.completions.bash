# shellcheck shell=bash

cite about-completion
about-completion 'Flutter bash completions'

if _command_exists flutter && flutter_completion=$(flutter bash-completion 2> /dev/null); then
  eval "$flutter_completion"
fi
unset flutter_completion
