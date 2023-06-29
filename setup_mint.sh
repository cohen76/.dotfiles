config_system() {
  xdg-settings set default-web-browser 'brave-browser.desktop'
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
}

config_gnome() {
  # sets tab & shift + tab to navigate between terminal tabs
  gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab'
  gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'
}

install_brave() {
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
  echo 'deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main' | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
  sudo apt update -y && sudo apt install -y brave-browser
}

install_codium() {
  wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
  echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
  sudo apt update -y && sudo apt install -y codium
}

install_git() {
  sudo apt install -y git
}

install_vlc() {
  sudo apt install -y vlc
}

install_gdebi() {
  sudo apt install -y gdebi
}

install_zsh() {
  sudo apt install -y zsh
}

install_ohmyzsh() {
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}

config_ohmyzsh() {
  chsh -s $(which zsh)
}

install_deb() {
  local url=${1}
  local temp=$(mktemp)
  wget -O ${temp} ${url}
  yes | sudo gdebi ${temp}
  rm -f ${temp}
}

install_discord() {
  install_deb 'https://discord.com/api/download?platform=linux&format=deb'
}

