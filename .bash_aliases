alias l='ls -lah --color=auto'
alias g='git'
alias k='kubectl'
alias cat='bat'
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top='sudo htop'
alias du="ncdu -rr -x --exclude .git --exclude node_modules"
alias help='tldr'
alias grep='grep --color'
alias awsp="source _awsp"

# kubectl
source <(kubectl completion bash)
source <(k completion bash)

# AWS
complete -C '/usr/bin/aws_completer' aws

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1        ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1       ;;
      *.rar)       rar x $1     ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xf $1        ;;
      *.tbz2)      tar xjf $1      ;;
      *.tgz)       tar xzf $1       ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1    ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# netinfo - shows network information for your system
netinfo () {
  echo "--------------- Network Information ---------------"
  /sbin/ifconfig | awk /'inet addr/ {print $2}'
  /sbin/ifconfig | awk /'Bcast/ {print $3}'
  /sbin/ifconfig | awk /'inet addr/ {print $4}'
  /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
  myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
  echo "${myip}"
  echo "---------------------------------------------------"
}

# dirsize - finds directory sizes and lists them for the current directory
dirsize () {
  du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
  egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
  egrep '^ *[0-9.]*M' /tmp/list
  egrep '^ *[0-9.]*G' /tmp/list
  rm -rf /tmp/list
}

# copy and go to dir
cpg () {
  if [ -d "$2" ];then
    cp $1 $2 && cd $2
  else
    cp $1 $2
  fi
}

# move and go to dir
mvg () {
  if [ -d "$2" ];then
    mv $1 $2 && cd $2
  else
    mv $1 $2
  fi
}

# Samuel Maftoul Ninjatism
up() {
  local x='';
  for i in $(seq ${1:-1});
    do x="$x../";
  done;
  cd $x;
}

toggle_ps1_extra() {
  local VARIABLE=${1}_PS1
  local CURRENT_VAL=${!VARIABLE}
  local NEXT_VAL=$((1-${!VARIABLE}))

  sed -i ~/.bash_exports -e "s/export ${VARIABLE}=\(0\|1\)/export ${VARIABLE}=${NEXT_VAL}/g"
  export $VARIABLE=$NEXT_VAL
}
