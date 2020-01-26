path=(
  $HOME/.local/bin
  /usr/local/opt/ruby/bin
  /usr/local/{bin,sbin}
  $path
)
fpath=(
  $HOME/.zprompts
  $HOME/.zfuncs
  $fpath
)

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# Remove / from WORDCHARS so that I can alt-move through directories
WORDCHARS=${WORDCHARS/\//}

unsetopt beep
unsetopt extendedglob
unsetopt correct
unsetopt nomatch

setopt complete_aliases

bindkey -e

zstyle :compinstall filename $HOME/.zshrc
zstyle ':completion:*' menu select

autoload -Uz compinit && compinit

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export LESS='-F -g -i -M -R -w -X -z-4'

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

# Prompt
autoload -Uz promptinit && promptinit && prompt zachwhaley

# pyenv
if which pyenv-virtualenv-init > /dev/null
then eval "$(pyenv virtualenv-init -)"
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Auto suggestion
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
