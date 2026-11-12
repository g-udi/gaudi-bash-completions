# shellcheck shell=bash

cite about-completion
about-completion 'Git bash completions'

# Make sure git is installed
_binary_exists git || return 0

# Don't handle completion if it's already managed
if complete -p git &> /dev/null; then
	_log_warning "completion already loaded - this usually means it is safe to stop using this completion"
	return 0
fi

# GIT_EXE, when set, names the git whose completion file is wanted
_git_bash_completion_exe="${GIT_EXE:-$(command -v git)}"
_git_bash_completion_found=false

# Load the first completion file found in the standard locations
for _git_bash_completion_path in \
	"${_git_bash_completion_exe%/*}/../share/git-core/git-completion.bash" \
	"${_git_bash_completion_exe%/*}/../share/git-core/contrib/completion/git-completion.bash" \
	"${_git_bash_completion_exe%/*}/../etc/bash_completion.d/git-completion.bash"; do
	if [[ -r "$_git_bash_completion_path" ]]; then
		_git_bash_completion_found=true
		# shellcheck disable=SC1090 # don't follow
		source "$_git_bash_completion_path"
		break
	fi
done

# macOS non-system location: xcrun is only asked when nothing was found above
if [[ "$_git_bash_completion_found" == false ]] && _binary_exists xcrun; then
	_git_bash_completion_path="$(xcrun --find git 2> /dev/null)"
	_git_bash_completion_path="${_git_bash_completion_path%/bin/git}/share/git-core/git-completion.bash"
	if [[ -r "$_git_bash_completion_path" ]]; then
		_git_bash_completion_found=true
		# shellcheck disable=SC1090 # don't follow
		source "$_git_bash_completion_path"
	fi
fi

# Cleanup
if [[ "${_git_bash_completion_found}" == false ]]; then
	_log_warning "no completion files found - please try enabling the 'system' completion instead."
fi
unset _git_bash_completion_exe _git_bash_completion_found _git_bash_completion_path
