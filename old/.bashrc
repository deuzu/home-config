# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Prompt
eval "$(starship init bash)"

# Exports & startups
export TERM=xterm-color
export EDITOR=helix
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

## Bin
PATH="$PATH:$HOME/.local/bin"

## Rust
. "$HOME/.cargo/env"

## Atuin
eval "$(atuin init bash)"

## fnm
export PATH="/home/ftouya/.local/share/fnm:$PATH"
eval "`fnm env`"

## TFenv
export PATH="$HOME/.tfenv/bin:$PATH"