# shellcheck shell=bash

cite about-completion
about-completion 'Vue.js completions'

# command -v: a function counts too (vue often comes from a node version
# manager that is only loaded on first use)
if command -v vue > /dev/null 2>&1; then
    __vuejs_completion()  {
        local opts=(--version --help create add invoke inspect serve build ui init config upgrade info)
        local _opt_
        COMPREPLY=()
        for _opt_ in "${opts[@]}"; do
            if [[ "$_opt_" == "$2"* ]]; then
                COMPREPLY+=("$_opt_")
            fi
        done
    }

    complete -F __vuejs_completion vue
fi
