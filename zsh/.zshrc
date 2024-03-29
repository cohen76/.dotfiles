# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Custom setup
function init_keychain() {
  eval "$(keychain --quiet --eval --agents ssh 'github_cohen76')"
}

function init_nvm() {
  export NVM_DIR="$HOME/.nvm"
  . '/usr/share/nvm/nvm.sh'
  . '/usr/share/nvm/bash_completion'
  . '/usr/share/nvm/install-nvm-exec'
}

init_keychain
init_nvm

export EDITOR='nvim'

