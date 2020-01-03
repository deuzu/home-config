# home-config

Config files for linux home

## Prerequisites

- `apt install git httpie jq htop ncdu vim`
- [bat](https://github.com/sharkdp/bat#installation)
- [prettyping](https://github.com/denilsonsa/prettyping#installation)
- [fzf](https://github.com/junegunn/fzf#installation)
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy#install)
- [nvm](https://github.com/nvm-sh/nvm#installation-and-update)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
- [gcloud cli](https://cloud.google.com/sdk/docs/#install_the_latest_cloud_tools_version_cloudsdk_current_version)
- `npm install -g awsp`
- `npm install -g tldr`
- [sampler](https://github.com/sqshq/sampler)
- [bandwhich](https://github.com/imsnif/bandwhich)

## Setup

```bash
# Git
curl https://raw.githubusercontent.com/deuzu/home-config/master/git/config > ~/.gitconfig

# Bash config files
curl https://raw.githubusercontent.com/deuzu/home-config/master/.bashrc > ~/.bashrc
curl https://raw.githubusercontent.com/deuzu/home-config/master/.bash_aliases > ~/.bash_aliases
curl https://raw.githubusercontent.com/deuzu/home-config/master/.bash_completion > ~/.bash_completion
curl https://raw.githubusercontent.com/deuzu/home-config/master/.bash_exports > ~/.bash_exports
mkdir ~/.sampler ; curl https://raw.githubusercontent.com/deuzu/home-config/master/sampler/config.yaml > ~/.sampler/config.yaml
