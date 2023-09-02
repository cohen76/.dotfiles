#!/bin/bash

config_system_defaults () {
  sudo chsh --shell "$(which zsh)"
}

config_desktop_env () {
  # sets tab & shift + tab to navigate between terminal tabs
  gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab'
  gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
}

install_git () {
  sudo pacman --sync --noconfirm 'git'
}

install_man_db () {
  sudo pacman --sync --noconfirm 'man-db'
}

install_neovim () {
  sudo pacman --sync --noconfirm 'neovim'
}

install_rustup () {
  sudo pacman --sync --noconfirm 'rustup'
}

install_pip () {
  sudo pacman --sync --noconfirm 'python-pip'
}

install_zsh () {
  sudo pacman --sync --noconfirm 'zsh'
}

install_opensecret () {
  sudo pacman --sync --noconfirm 'libsecret'
}

install_discord () {
  sudo pacman --sync --noconfirm 'discord'
}

install_neofetch () {
  sudo pacman --sync --noconfirm 'neofetch'
}

install_dnsutils () {
  # installs the command 'nslookup'
  sudo pacman --sync --noconfirm 'dnsutils'
}

install_from_aur () {
  local package="$1"
  local tempdir="$(mktemp --directory)"
  echo "https://aur.archlinux.org/${package}.git" "$tempdir"
  git clone "https://aur.archlinux.org/${package}.git" "$tempdir"
  (cd "$tempdir" && makepkg --syncdeps --install --noconfirm)
  rm -rf "$tempdir"
}

install_paru_bin () {
  install_from_aur 'paru-bin'
}

install_librewolf_bin () {
  paru --sync --noconfirm 'librewolf-bin'
}

install_brave_bin () {
  # I have had problems with librewolf, but brave works fine.
  paru --sync --noconfirm 'brave-bin'
}

install_codium () {
  paru --sync --noconfirm 'vscodium-bin'
}
