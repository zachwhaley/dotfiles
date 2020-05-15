path=(
  $HOME/.local/bin
  $HOME/.pyenv/bin
  /usr/local/opt/python/libexec/bin
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
# case-insensitive,partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select

autoload -Uz compinit && compinit

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export LESS='-F -g -i -M -R -w -X -z-4'

export TF_PLUGIN_CACHE_DIR=~/.terraform.d/plugin_cache

alias vi=nvim
alias ls='ls -FG'
alias l='ls'
alias la='ls -A'
alias ll='ls -lh'
alias lla='ll -A'

alias tmux='tmux -2'
alias tm='tmux'
alias tma='tmux a'

alias tf=terraform
alias tg=terragrunt

alias py=python

# Prompt
autoload -Uz promptinit && promptinit && prompt zachwhaley

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
# Syntax highlighting
[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Auto suggestion
[ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
