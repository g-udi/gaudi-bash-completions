_gaudi-bash-comp-enable-disable () {
  local enable_disable_args="alias completion plugin"
  COMPREPLY=( $(compgen -W "${enable_disable_args}" -- ${cur}) )
}

_gaudi-bash-comp-list-available-not-enabled () {
  subdirectory="$1"

  local available_things

  available_things=$(for f in $(compgen -G "${GAUDI_BASH}/components/$subdirectory/*.bash" | sort -d);
    do
      file_entity=$(basename $f)

      local enabled_components=$(command ls "${GAUDI_BASH}/components/enabled/"[0-9]*$GAUDI_BASH_LOAD_PRIORITY_SEPARATOR$file_entity 2>/dev/null | head -1)

      if [[ -z "$enabled_components" ]]
      then
        basename $f | sed -e 's/\(.*\)\..*\.bash/\1/g'
      fi
    done)

  COMPREPLY=( $(compgen -W "all ${available_things}" -- ${cur}) )
}

_gaudi-bash-comp-list-enabled () {
  local subdirectory="$1"
  local suffix enabled_things

  suffix=$(echo "$subdirectory" | sed -e 's/plugins/plugin/g')

  enabled_things=$(for f in $(sort -d <(compgen -G "${GAUDI_BASH}/components/enabled/*.${suffix}.bash") <(compgen -G "${GAUDI_BASH}/components/enabled/*.${suffix}.bash"));
    do
      basename "$f" | sed -e 's/\(.*\)\..*\.bash/\1/g' | sed -e "s/^[0-9]*___//g"
    done)

  COMPREPLY=( $(compgen -W "all ${enabled_things}" -- ${cur}) )
}

_gaudi-bash-comp-list-available () {
  subdirectory="$1"

  local enabled_things

  enabled_things=$(for f in $(compgen -G "${GAUDI_BASH}/components/$subdirectory/*.bash" | sort -d);
    do
      basename $f | sed -e 's/\(.*\)\..*\.bash/\1/g'
    done)

  COMPREPLY=( $(compgen -W "${enabled_things}" -- ${cur}) )
}

_gaudi-bash-comp () {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  chose_opt="${COMP_WORDS[1]}"
  file_type="${COMP_WORDS[2]}"
  opts="version help doctor reload restart search update backup restore disable enable show"
  case "${chose_opt}" in
    show)
      local show_args="aliases completions plugins"
      COMPREPLY=( $(compgen -W "${show_args}" -- ${cur}) )
      return 0
      ;;
    help)
      if [[ x"${prev}" == x"aliases" ]]; then
        _gaudi-bash-comp-list-available aliases
        return 0
      else
        local help_args="aliases completions migrate plugins update"
        COMPREPLY=( $(compgen -W "${help_args}" -- ${cur}) )
        return 0
      fi
      ;;
    doctor)
      local doctor_args="errors warnings all"
      COMPREPLY=( $(compgen -W "${doctor_args}" -- ${cur}) )
      return 0
      ;;
    migrate | reload | search | update | version)
      return 0
      ;;
    enable | disable)
      if [[ x"${chose_opt}" == x"enable" ]];then
        suffix="available-not-enabled"
      else
        suffix="enabled"
      fi
      case "${file_type}" in
        alias)
            _gaudi-bash-comp-list-${suffix} aliases
            return 0
            ;;
        plugin)
            _gaudi-bash-comp-list-${suffix} plugins
            return 0
            ;;
        completion)
            _gaudi-bash-comp-list-${suffix} completion
            return 0
            ;;
        *)
            _gaudi-bash-comp-enable-disable
            return 0
            ;;
      esac
      ;;
  esac

  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )

  return 0
}

# Activate completion for gaudi-bash and its common misspellings
complete -F _gaudi-bash-comp gaudi-bash
complete -F _gaudi-bash-comp gudi-bash