alias tmux='tmux -2'

# $PS1
export PS1="\[\e[36;1m\]\u\[\e[33;1m\]@\[\e[32;1m\]\h \[\e[31;1m\]\w\[\e[34;1m\]: \[\e[0m\]\n\[\e[32;1m\]-> \[\e[32;1m\]"
source ~/.vim/git-completion.bash

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
