path=(
  $HOME/.local/bin
  /usr/local/{bin,sbin}
  $path
)

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

export LESS='-F -g -i -M -R -w -X -z-4'

export PYENV_ROOT=$(pyenv root)
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
