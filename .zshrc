# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Sets the terminal theme. Choose 'random' to get a feel for all the different
# options. See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes for options.
ZSH_THEME='fwalch'

# Configures case-sensitive completion. Set to 'true' or 'false'.
CASE_SENSITIVE='false'

# Configures hyphen-insensitive completion. Makes _ and - are interchangeable.
# for completion. Set to 'true' or 'false'.
HYPHEN_INSENSITIVE='false'

# Configures auto-setting terminal title. Set to 'true' or 'false'.
DISABLE_AUTO_TITLE="false"

# Configure magic functions. When pasting into the terminal, sometimes
# additional characters are added to to the pasted text. For example, pasting
# 'wget http://{DEFAULT_IP}/index.html' results in
# 'wget http://\{DEFAULT_IP\}/index.html' being pasted in instead. This setting
# configures this behavior. See https://stackoverflow.com/questions/25614613 for
# more details. Set to 'true' or 'false'. 
DISABLE_MAGIC_FUNCTIONS='false'

# Configures colors in ls. Set to 'true' or 'false'.
DISABLE_LS_COLORS='false'

# Configures command auto-correction. Set to 'true' or 'false'.
ENABLE_CORRECTION='false'

# Configures the display of waiting dots for delayed completion. Set to 'true'
# or 'false'.
# 
# Caution: setting this to 'true' can cause issues with multiline prompts in
# zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS='false'

# Configures the color and string of waiting dots for delayed completion
# COMPLETION_WAITING_DOTS='%F{red}...%f'

# Configures marking untracked files under VCS as dirty. This makes repository
# status check for large repositories much, much faster when set to 'true'. Set
# to 'true' or 'false'
DISABLE_UNTRACKED_FILES_DIRTY='false'

# Configures timestamps formatting when using the 'omz_history' command. The
# command 'omz_history' is also aliased to 'history'. Set to 'mm/dd/yyyy',
# 'dd.mm.yyyy', 'yyyy-mm-dd', or a custom format using the strftime function
# format specifications, see 'man strftime' for more details.
HIST_STAMPS='%Y.%m.%d %H:%m'

# Configures path to zsh custom directory.
ZSH_CUSTOM="$ZSH/custom"

# Configures auto-update behavior. Use 'disabled' to disable automatic updates,
# 'auto' to update automatically without asking, or 'reminder' to remind you
# when a new update is available.
OMZ_AUTO_UPDATE='auto'

# Configures auto-update frequence in days. For example use '10' to auto
# update every 10 days
OMZ_AUTO_UPDATE_FREQUENCY='10'

zstyle ':omz:update' mode $OMZ_AUTO_UPDATE
zstyle ':omz:update' frequency $OMZ_AUTO_UPDATE_FREQUENCY

# Configures loaded plugins. Standard plugins can be found in '$ZSH/plugins/'.
# Custom plugins may be added to '$ZSH_CUSTOM/plugins/'.
plugins=(
  command-not-found
  git
  gnu-utils
  node
  npm
  poetry
  rust
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# pnpm
export PNPM_HOME="/home/jacob/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# rustup
. "$HOME/.cargo/env"

# poetry
export PATH="/home/jacob/.local/bin:$PATH"

