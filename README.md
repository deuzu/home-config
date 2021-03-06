# home-config

Config files for linux home

## Setup

```bash
# Git
curl https://raw.githubusercontent.com/deuzu/home-config/master/git/config > ~/.gitconfig

# Bash config files
curl https://raw.githubusercontent.com/deuzu/home-config/master/install.sh | bash

# Binaries
curl https://raw.githubusercontent.com/deuzu/home-config/master/bin/crypt-folder > ~/bin/crypt-folder

# Inside Nu (after shell restart)
echo $nu.path | prepend "/usr/local/bin/nu" | config set_into path
echo $nu.path | prepend "/home/ftouya/.cargo/bin" | config set_into path
echo $nu.path | prepend "/home/ftouya/.npm/bin" | config set_into path
echo $nu.path | prepend "/home/ftouya/bin" | config set_into path
echo $nu.env | insert LD_LIBRARY_PATH "/usr/local/lib" | config set_into env
echo $nu.env | insert GPG_TTY $(tty) | config set_into env

config load /tmp/install-home-config/config.toml
rm /tmp/install-home-config -rf
```

## To do

- [x] Fix freeze when using autocompletion on commands [https://github.com/nushell/nushelphell/issues/2639](https://github.com/nushell/nushell/issues/2639)?
- [x] Fix aliases for commands with multiple args [https://github.com/nushell/nushell/issues/378#issuecomment-686304366](https://github.com/nushell/nushell/issues/378#issuecomment-686304366)?
- [] [teeldeer](https://github.com/dbrgn/tealdeer)
- [] [fzf](https://github.com/junegunn/fzf#installation) with Nu
- [] [sampler](https://github.com/sqshq/sampler)
