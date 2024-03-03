# shellcheck shell=bash

cite about-completion
about-completion 'Rustup (Rust toolchain installer) completion'

if _binary_exists rustup; then
	eval "$(rustup completions bash)"
fi
