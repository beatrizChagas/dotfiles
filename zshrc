. ~/.alias

. $HOME/.asdf/asdf.sh
. <(kubectl completion zsh)

## enable the default zsh completions!
autoload -Uz compinit && compinit

# rbenv
export PATH="usr/local/var/.rbenv/bin:$PATH"
export PATH="usr/local/var/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

# prompt with git && rbenv
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# auto activate virtualenv when entering its root path
function auto_activate_virtualenv {
  if [[ "$VIRTUAL_ENV" = "" && -f "$PWD/env/bin/activate" ]]; then
# source "$PWD/env/bin/activate"  # commented out by conda initialize
  fi
}

function prompt_command {
  # other stuff
  # ...
  auto_activate_virtualenv
}

export PROMPT_COMMAND=prompt_command

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Set up the prompt
setopt PROMPT_SUBST
PROMPT='%1~ %F{green}${vcs_info_msg_0_}%f $ '


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/beatrizchagas/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/beatrizchagas/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/beatrizchagas/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/beatrizchagas/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
