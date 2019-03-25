alias vi nvim
alias tm 'tmux -2'

# Enable fzf key bindings
fzf_key_bindings

# Pyenv
set -x PATH "/home/zacharyw/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
