# shellcheck shell=bash

cite about-completion
about-completion 'Go bash completions'

# Install gocomplete:
# go get -u github.com/posener/complete/gocomplete
# gocomplete -install

if gocomplete_bin=$(command -v gocomplete) && _command_exists go ; then
  complete -C "$gocomplete_bin" go
fi
unset gocomplete_bin
