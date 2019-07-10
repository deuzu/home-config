
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color) color_prompt=yes;;
esac

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
fi

# Color mapping
grey='\[\033[1;30m\]'
red='\[\033[0;31m\]'
RED='\[\033[1;31m\]'
green='\[\033[0;32m\]'
GREEN='\[\033[1;32m\]'
yellow='\[\033[0;33m\]'
YELLOW='\[\033[1;33m\]'
purple='\[\033[0;35m\]'
PURPLE='\[\033[1;35m\]'
white='\[\033[0;37m\]'
WHITE='\[\033[1;37m\]'
blue='\[\033[0;34m\]'
BLUE='\[\033[1;34m\]'
cyan='\[\033[0;36m\]'
CYAN='\[\033[1;36m\]'
NC='\[\033[0m\]'

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

PS1_PWD="$RED\w$NC"

set_extra_ps1 () {
  PS1_EXTRAS=""

  if [ -d .git ]; then
    PS1_EXTRAS="\n"
  fi;

  # Get Git current branch
  if [ -x "$(command -v git)" ] && [ -d .git ]; then
    PS1_EXTRAS="$PS1_EXTRAS${CYAN}git::\$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  fi;

  # Get Kubernetes current config if on a git project
  if [ -x "$(command -v kubectl)" ] && [ -d .git ]; then
    PS1_EXTRAS="$PS1_EXTRAS $WHITE| ${PURPLE}k8s::\$(kubectl config current-context)"
  fi;

  # Get AWS current config if on a git project
  if [ -x "$(command -v _awsp)" ] && [ -d .git ]; then
    PS1_EXTRAS="$PS1_EXTRAS $WHITE| ${GREEN}aws::\${AWS_PROFILE:=default}"
  fi;

  PS1_EXTRAS="$PS1_EXTRAS$NC"
  PS1="$PS1_PWD$PS1_EXTRAS\n${debian_chroot:+($debian_chroot)}\$ "
}

PROMPT_COMMAND="set_extra_ps1"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Alias definitions.
if [ -f ~/.bash_exports ]; then
    . ~/.bash_exports
fi
