# shellcheck shell=bash

cite about-completion
about-completion 'Cargo (Rust package manager) completion'

if _binary_exists rustup && _binary_exists cargo; then
	eval "$(rustup completions bash cargo)"
fi
