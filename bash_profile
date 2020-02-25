
. ~/.alias

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# prompt with git && rbenv
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# set ps1
if [ -f $BASH_COMPLETION_DIR/git ] && [ -f `which rbenv` ]; then
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
elif [ -f $BASH_COMPLETION_DIR/git ]; then
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\]  '
elif [ `which rbenv` ]; then
  export PS1="\[\033[38;5;66m\]➜ \[\033[38;5;62m\]\\W \[\033[38;5;244m\]\$(parse_git_branch) \[\033[01;34m\]\$\[\033[00m\] "
else
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

alias vim=nvim
export EDITOR=vim
