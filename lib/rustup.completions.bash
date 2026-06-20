# shellcheck shell=bash
cite about-completion
about-completion "rustup (Rust toolchain installer) completion"

# Make sure rustup is installed
_command_exists rustup || return 0

# Don't handle completion if it's already managed
complete -p rustup &> /dev/null && return 0

if rustup_completion=$(rustup completions bash 2> /dev/null); then
  eval "$rustup_completion"
fi
unset rustup_completion
