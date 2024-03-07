# gaudi-bash completions

This repo contains a submodule for [gaudi-bash](https://github.com/g-udi/gaudi-bash) with all the plugins it loads.

The completions can make use of the [helper functions](https://github.com/g-udi/gaudi-bash/blob/master/lib/helpers/utils.bash) of gaudi-bash:
- `_is_function`: check if the passed parameter is a function
- `_command_exists`: check if the command passed as the argument exists
- `_binary_exists`: check if the binary passed as the argument exists
- `_completion_exists`: check if the completion function passed as the argument exists
- `_read_input`: reads input from the prompt for a yes/no (one character) input
- `_array-contains`: searches an array for an exact match against the term passed as the first argument to the function. The function exits as soon as a match is found
- `_array-dedupe`: creates a concatenated array of unique and sorted elements
- `_clean-string`: cleans a string from whitespace given a passed cleaning mode

## Checklist

- [ ] Make sure to have `# shellcheck shell=bash` at the top of every file and have an empty newline after
- [ ] Make sure to have the `cite about-plugin`
- [ ] Make sure to fill in a description of the alias in the `about-plugin`

 ```bash
# shellcheck shell=bash

cite about-completion
about-completion 'Automatic completion of aliases'
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
- **[docker-compose](/lib/docker-compose.completions.bash)**: Dokcer compose bash completions
- **[docker-machine](/lib/docker-machine.completions.bash)**: Docker machine bash completions
- **[docker](/lib/docker.completions.bash)**: Docker bash completions
- **[export](/lib/export.completions.bash)**: Export bash completions
- **[fabric](/lib/fabric.completions.bash)**: Fabric bash completions
- **[flutter](/lib/flutter.completions.bash)**: Flutter bash completions
- **[gaudi-bash](/lib/gaudi-bash.completions.bash)**: Gaudi bash completions
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
- **[hub](/lib/hub.completions.bash)**: Hub bash completions. This script complements the completion script that ships with git
- **[kubectl](/lib/kubectl.completions.bash)**: Kubectl (Kubernetes CLI) completion
- **[lerna](/lib/lerna.completions.bash)**: Lerna bash completions
- **[makefile](/lib/makefile.completions.bash)**: Makefile bash completions
- **[maven](/lib/maven.completions.bash)**: Maven bash completions
- **[minikube](/lib/minikube.completions.bash)**: Minikube (Local Kubernetes) completion
- **[ngrok](/lib/ngrok.completions.bash)**: Ngrok bash completions
- **[npm](/lib/npm.completions.bash)**: NPM (Node Package Manager) completion
- **[nvm](/lib/nvm.completions.bash)**: NVM (Node Version Manager) bash completions
- **[openshift](/lib/openshift.completions.bash)**: Openshift bash completions
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