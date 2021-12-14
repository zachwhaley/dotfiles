path=(
  $HOME/.local/bin
  /usr/local/opt/ruby/bin
  /usr/local/{bin,sbin}
  $HOME/go/bin
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

alias py=python

# Prompt
autoload -Uz promptinit && promptinit && prompt zachwhaley

# pyenv
eval "$(pyenv init -)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
# History substring search
[ -f /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh ] && source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
# Syntax highlighting
[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Auto suggestion
[ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#awslogin develop
#export AWS_PROFILE=develop
#export CODEARTIFACT_TOKEN=$(aws codeartifact get-authorization-token --domain trendmicro --domain-owner 764255788659 --region us-west-2 --duration-seconds 3600 --query authorizationToken --output text)

export TF_RECREATE_MISSING_LAMBDA_PACKAGE='false'
export TERRAGRUNT_TFPATH=tf15
