path=(
  $HOME/.local/bin
  /usr/local/opt/ruby/bin
  /usr/local/{bin,sbin}
  /Users/zacharyw/Library/Python/3.9/bin
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

export GOPATH=$HOME/go
path=(
  $GOPATH/bin
  $path
)

alias vi=nvim
alias ls='ls -FG'
alias l='ls -1'
alias la='ls -A'
alias ll='ls -lh'
alias lla='ll -A'

alias tmux='tmux -2'
alias tm='tmux'
alias tma='tmux a'

alias tf=terraform
alias tg=terragrunt

alias python=python3
alias py=python

# Prompt
autoload -Uz promptinit && promptinit && prompt zachwhaley

# pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh

# Shrink path
[ -f ~/.zfuncs/shrink_path.zsh ] && source ~/.zfuncs/shrink_path.zsh

# Git prompt
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

# History substring search
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# Syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto suggestion
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
