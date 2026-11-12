# gaudi-bash completions

This repo holds the completions that [gaudi-bash](https://github.com/g-udi/gaudi-bash) and [gaudi-shell](https://github.com/g-udi/gaudi-shell) load. Both frameworks include it as a git submodule. They are bash completions: under zsh, gaudi-shell turns `complete` into a no-op, so a file there does nothing.

## Host contract

The files in `lib/` are shared, byte for byte, by [gaudi-bash](https://github.com/g-udi/gaudi-bash) (bash 4.3 or later) and [gaudi-shell](https://github.com/g-udi/gaudi-shell) (bash 3.2 or later, and zsh). A file must therefore not name either framework (no `GAUDI_BASH*` or `GAUDI_SHELL*` variable, no `gbash` or `gshell` command) and may only rely on what both frameworks provide:

| Name | Meaning |
| --- | --- |
| `cite`, `about-alias`, `about-plugin`, `about-completion`, `about`, `group`, `param`, `example`, `priority` | metadata read by `show`, `search`, `help` and `enable` |
| `_command_exists <name>` | true when `<name>` is anything the shell can run (function, alias, builtin or program); logs an error otherwise, so it is for things that must be there |
| `_binary_exists <name>` | true only when `<name>` is a program on `PATH`; a function or an alias does not count. The probe for an optional tool (use `command -v <name>` when a function should count too) |
| `_homebrew-check` | true when Homebrew is installed; sets `GAUDI_HOST_HOMEBREW_PREFIX` |
| `pathmunge <dir> [after]` | add a directory to `PATH` once |
| `_log_debug`, `_log_warning`, `_log_error` | logging |
| `_read_input <question>` | asks a yes/no question and leaves the answer in `REPLY` (`y` or `Y` means yes) |
| `_array-contains <item> <element>...` | true when `<item>` is one of the elements |
| `NC`, `BLACK`, `RED`, `GREEN`, `YELLOW`, `BLUE`, `MAGENTA`, `CYAN`, `WHITE` and their `BOLD_` forms | colour escape sequences, empty when colours are off; `NC` resets. Print them through a `printf` format string or `echo -e` |
| `GAUDI_HOST_NAME` | the framework's name (`gaudi-bash` or `gaudi-shell`), for messages and cache folders |
| `GAUDI_HOST_COMMAND` | the command its users type (`gbash` or `gshell`) |
| `GAUDI_HOST_HOME` | its install directory; `components/enabled` and `components/custom` live under it |
| `GAUDI_HOST_SED_I_PARAMETERS` | array with the arguments that make `sed` edit in place on this OS |
| `GAUDI_HOST_HOMEBREW_PREFIX` | the Homebrew prefix, empty until `_homebrew-check` or the brew plugin has found it |
| `_gaudi_host_setting <NAME>` | prints the user's setting `<NAME>` (for example `HTTP_PROXY`): `GAUDI_<NAME>`, otherwise the framework's own `GAUDI_BASH_<NAME>` or `GAUDI_SHELL_<NAME>` |

Each framework defines these once, in its `lib/helpers/utils.bash`. Keep every file loadable by bash 3.2 (no `mapfile`, `declare -A`, `${var,,}`, `&>>` or negative array indexes) unless it only makes sense in bash 4, and guard anything that cannot work in zsh with `[[ -n "${ZSH_VERSION:-}" ]]` (a file zsh cannot even parse starts with `[[ -n "${BASH_VERSION:-}" ]] || return 0`). Nothing slow may run when a file loads: a tool that prints its own completion script is asked for it on the first TAB (see the `_gaudi_lazy_completion_*` functions, for example in `lib/kubectl.completions.bash`).

## Checklist

- [ ] Make sure to have `# shellcheck shell=bash` at the top of every file and have an empty newline after
- [ ] Make sure to have the `cite about-completion`
- [ ] Make sure to fill in a description of the completion in the `about-completion`

 ```bash
# shellcheck shell=bash

cite about-completion
about-completion 'Gaudi bash completions'
 ```

## Completions

- **[asdf](/lib/asdf.completions.bash)**: asdf completions | The multiple runtime version manager
- **[awscli](/lib/awscli.completions.bash)**: AWS CLI completions
- **[brew](/lib/brew.completions.bash)**: Brew completions
- **[bundler](/lib/bundler.completions.bash)**: Bash completion for the `bundle` command
- **[capistrano](/lib/capistrano.completions.bash)**: Bash completion support for Capistrano
- **[cargo](/lib/cargo.completions.bash)**: Cargo (Rust package manager) completion
- **[composer](/lib/composer.completions.bash)**: Composer completion
- **[conda](/lib/conda.completions.bash)**: Enable Conda completions
- **[consul](/lib/consul.completions.bash)**: Consul bash completions
- **[defaults](/lib/defaults.completions.bash)**: Bash command line completion for defaults
- **[dirs](/lib/dirs.completions.bash)**: Bash completion support for the 'dirs' plugin (commands G, R).
- **[docker-compose](/lib/docker-compose.completions.bash)**: Docker Compose bash completions
- **[docker](/lib/docker.completions.bash)**: Docker bash completions
- **[dotnet](/lib/dotnet.completions.bash)**: bash parameter completion for the dotnet CLI
- **[export](/lib/export.completions.bash)**: Export bash completions
- **[fabric](/lib/fabric.completions.bash)**: Fabric bash completions
- **[flutter](/lib/flutter.completions.bash)**: Flutter bash completions
- **[gaudi-bash](/lib/gaudi-bash.completions.bash)**: Gaudi bash completions (completes the `gbash` command)
- **[gcloud](/lib/gcloud.completions.bash)**: Google Cloud bash completions
- **[gem](/lib/gem.completions.bash)**: Gem bash completions
- **[git](/lib/git.completions.bash)**: Git bash completions
- **[git_flow](/lib/git_flow.completions.bash)**: Gitflow bash completions
- **[github-cli](/lib/github-cli.completions.bash)**: GitHub CLI completion
- **[go](/lib/go.completions.bash)**: Go bash completions
- **[gradle](/lib/gradle.completions.bash)**: Gradle bash completions
- **[grunt](/lib/grunt.completions.bash)**: Grunt bash completions
- **[gulp](/lib/gulp.completions.bash)**: Gulp bash completions
- **[helm](/lib/helm.completions.bash)**: Helm (Kubernetes Package Manager) completions
- **[homesick](/lib/homesick.completions.bash)**: Homesick bash completions
- **[kind](/lib/kind.completions.bash)**: kind (Kubernetes IN Docker) completion
- **[kubectl](/lib/kubectl.completions.bash)**: Kubectl (Kubernetes CLI) completion
- **[lerna](/lib/lerna.completions.bash)**: Lerna bash completions
- **[makefile](/lib/makefile.completions.bash)**: Makefile bash completions
- **[maven](/lib/maven.completions.bash)**: Maven bash completions
- **[minikube](/lib/minikube.completions.bash)**: Minikube (Local Kubernetes) completion
- **[ngrok](/lib/ngrok.completions.bash)**: Ngrok bash completions
- **[npm](/lib/npm.completions.bash)**: NPM (Node Package Manager) completion
- **[nvm](/lib/nvm.completions.bash)**: NVM (Node Version Manager) bash completions
- **[openshift](/lib/openshift.completions.bash)**: Openshift bash completions
- **[pack](/lib/pack.completions.bash)**: pack (Cloud Native Buildpacks CLI) completion
- **[packer](/lib/packer.completions.bash)**: Packer bash completions
- **[pip](/lib/pip.completions.bash)**: Python pip package manager bash completions
- **[pm2](/lib/pm2.completions.bash)**: PM2 bash completions
- **[rabbitmq](/lib/rabbitmq.completions.bash)**: RabbitMQ bash completions
- **[rake](/lib/rake.completions.bash)**: Bash completion support for Rake, Ruby Make
- **[rustup](/lib/rustup.completions.bash)**: Rustup (Rust toolchain installer) completion
- **[rvm](/lib/rvm.completions.bash)**: Bash completion support for RVM
- **[sdkman](/lib/sdkman.completions.bash)**: Sdkman bash completions
- **[sqlmap](/lib/sqlmap.completions.bash)**: SQL Map bash completions
- **[ssh](/lib/ssh.completions.bash)**: Bash completion support for SSH
- **[svn](/lib/svn.completions.bash)**: SVN bash completions
- **[system](/lib/system.completions.bash)**: Loads the systems Bash completion modules
- **[terraform](/lib/terraform.completions.bash)**: Terraform bash completions
- **[tmux](/lib/tmux.completions.bash)**: Tmux bash completions
- **[travis](/lib/travis.completions.bash)**: Travis bash completions
- **[vagrant](/lib/vagrant.completions.bash)**: Vagrant bash completions
- **[vault](/lib/vault.completions.bash)**: Vault bash completion
- **[virsh](/lib/virsh.completions.bash)**: Bash completion for virsh - main CLI of libvirt borrowed from https://github.com/LuyaoHuang/virsh-bash-completion
- **[virtualbox](/lib/virtualbox.completions.bash)**: Virtualbox completions
- **[vuejs](/lib/vuejs.completions.bash)**: Vue.js completions
- **[yarn](/lib/yarn.completions.bash)**: YARN CLI completions
