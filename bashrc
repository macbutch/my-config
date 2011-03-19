export PATH=~/bin:$PATH
if [ "$OSTYPE" == "darwin10.0" ]; then
    export PATH=~/bin/osx/:$PATH
# TODO detect cygwin and linux here as well
# elif [ "$OSTYPE" == "cygwin" ]; then
#   blah blah
# elif [ "$OSTYPE" == "linux" ]; then
#   blah blah
fi

# Git stuff
parse_git_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "*"${ref#refs/heads/}"*"
}
source ~/bin/git-completion.bash
# includes the current git branch in the prompt
PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w  \[\e[1;34m\]$(parse_git_branch) \n\[\e[0m\]\$ '

export CLICOLOR=1
export MAVEN_OPTS="-Xmx1g -XX:MaxPermSize=512m"
alias vless='/usr/share/vim/vim72/macros/less.sh'
export GREP_OPTIONS='--binary-files=without-match --color=auto -i'

# should probably detect whether RVM is installed first
# (and if it isn't then we could complain about it)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

