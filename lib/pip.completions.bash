# shellcheck shell=bash

cite about-completion
about-completion 'Python pip package manager bash completions'

_pip() {
    local cur prev commands opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    first="${COMP_WORDS[0]}"

    commands=$($first --help | awk '/Commands:/,/General Options:/' | \
               \grep -E -o "^\s{2}\w+" | tr -d ' ')
    opts=$($first --help | \grep -E -o "((-\w{1}|--(\w|-)*=?)){1,2}")


    if [ $COMP_CWORD == 1 ] ; then
        COMPREPLY=( $(compgen -W "${commands}" -- ${cur}) )
        return 0
    fi

    if [[ ${cur} == -* ]] ; then
	local command_opts
        command_opts=$($first $prev --help | \
                             \grep -E -o "((-\w{1}|--(\w|-)*=?)){1,2}")
        COMPREPLY=( $(compgen -W "${command_opts}" -- ${cur}) )
        return 0
    fi
}

complete -o default -F _pip pip
complete -o default -F _pip pip2
complete -o default -F _pip pip3
