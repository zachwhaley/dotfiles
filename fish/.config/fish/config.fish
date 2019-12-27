alias vi nvim
alias tm tmux
alias tma "tm a"
alias tf terraform
alias tg terragrunt

set -gx EDITOR vi
set -gx TF_PLUGIN_CACHE_DIR ~/.terraform.d/plugin_cache

# Enable fzf key bindings
fish_fzf_key_bindings

# Enable pyenv
pyenv init - | source
