# path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# theme
ZSH_THEME="robbyrussell"

# cargo
. "$HOME/.cargo/env"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# poetry
export PATH="/home/cohen/.local/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# plugins
plugins=(
  git
  gnu-utils
  node
  npm
  nvm
  pip
  poetry
  pyenv
  python
  rust
  yarn
)

source $ZSH/oh-my-zsh.sh
