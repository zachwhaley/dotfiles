alias vi nvim
alias tm tmux
alias tma "tm a"

set -gx EDITOR vi

# Enable fzf key bindings
fish_fzf_key_bindings

# Enable pyenv
pyenv init - | source
