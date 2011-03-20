OS=`uname | tr '[A-Z]' '[a-z]'`
EXTRA_BIN="$HOME/bin"
if [ "$OS" == "darwin" ]; then
  EXTRA_BIN="$HOME/bin/osx/:$EXTRA_BIN"
else
  OS=`uname -o | tr '[A-Z' '[a-z]'`
  if [ "$OS" == "cygwin" ]; then
    EXTRA_BIN="$HOME/bin/cygwin:$EXTRA_BIN"
    . /etc/bash_completion
    # TMP and TEMP are defined in the Windows environment.  Leaving
    # them set to the default Windows temporary directory can have
    # unexpected consequences.
    unset TMP
    unset TEMP
  fi
# elif [ "$OSTYPE" == "linux" ]; then
#   blah blah
fi
export PATH=$EXTRA_BIN:$PATH

export CLICOLOR=1
export GREP_OPTIONS='--binary-files=without-match --color=auto -i'
alias vless='/usr/share/vim/vim72/macros/less.sh'

# go into vi mode for bash
# http://www.catonmat.net/download/bash-vi-editing-mode-cheat-sheet.txt
set -o vi
bind '"\C-i":complete'

if [ -n "`which mvn`" ]; then 
  export MAVEN_OPTS="-Xmx1g -XX:MaxPermSize=512m"
fi

# git stuff -- only if git is in the path
if [ -z "`which git`" ]; then
  PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w \n\[\e[0m\]\$ '
else
  parse_git_branch() {
      ref=$(git symbolic-ref HEAD 2> /dev/null) || return
      echo "*"${ref#refs/heads/}"*"
  }
  PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w  \[\e[1;34m\]$(parse_git_branch) \n\[\e[0m\]\$ '
  source "$HOME/bin/git-completion.bash"
fi

if [ -d "$HOME/.rvm" ]; then 
  # TODO handle when RVM is not installed into ~/.rvm
  # This loads a local RVM into a shell session.
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi
