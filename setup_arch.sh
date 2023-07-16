#!/bin/bash

config_desktop_env() {
  # sets tab & shift + tab to navigate between terminal tabs
  gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab'
  gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'
}

install_git () {
  sudo pacman --sync --noconfirm git
}

install_man_db () {
  sudo pacman --sync --noconfirm man-db
}

install_neovim () {
  sudo pacman --sync --noconfirm neovim
}

install_rustup () {
  sudo pacman --sync --noconfirm rustup
  rustup self update
}

install_pip () {
  sudo pacman --sync --noconfirm python-pip
}

install_from_aur () {
  local PACKAGE_NAME=$1
  local TEMP_DIR=$(mktemp --directory)
  git clone "https://aur.archlinux.org/${PACKAGE_NAME}.git" ${TEMP_DIR}
  (cd ${TEMP_DIR} && makepkg --syncdeps --install --noconfirm)
  rm -rf ${TEMP_DIR}
}

install_paru_bin () {
  install_from_aur 'paur-bin'
}

install_librewolf_bin () {
  paru --sync --noconfirm librewolf-bin
}

install_discord () {
  sudo pacman --sync --noconfirm discord
}

