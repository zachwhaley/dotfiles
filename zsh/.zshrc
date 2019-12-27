HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep extendedglob
bindkey -e

zstyle :compinstall filename $HOME/.zshrc
zstyle ':completion:*' menu select

setopt COMPLETE_ALIASES
autoload -Uz compinit
compinit

alias vi=nvim
alias ls='ls -FG'
alias l='ls'
alias la='ls -A'
alias ll='ls -lh'
alias lla='ll -A'

alias tmux='tmux -2'
alias tm='tmux'
alias tma='tmux a'

alias python=python3
alias py=python

unsetopt CORRECT
unsetopt NOMATCH

# Prompt
fpath=( "$HOME/.zprompts" $fpath )
autoload -Uz promptinit
promptinit
prompt zachwhaley

# pyenv
if which pyenv-virtualenv-init > /dev/null
then eval "$(pyenv virtualenv-init -)"
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
