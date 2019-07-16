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

unsetopt CORRECT
unsetopt NOMATCH

# Prompt
fpath=( "$HOME/.zprompts" $fpath )
autoload -Uz promptinit
promptinit
prompt zachwhaley

# pyenv
eval "$(pyenv init - --no-rehash zsh)"
eval "$(pyenv virtualenv-init - zsh)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
