# shellcheck shell=bash
cite about-completion
about-completion "cargo (Rust package manager) completion"

# Make sure cargo is installed
_command_exists rustup || return 0
_command_exists cargo || return 0

# Don't handle completion if it's already managed
complete -p cargo &> /dev/null && return 0

if cargo_completion=$(rustup completions bash cargo 2> /dev/null); then
  eval "$cargo_completion"
fi
unset cargo_completion
