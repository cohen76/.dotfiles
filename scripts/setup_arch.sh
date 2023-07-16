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

install_zsh () {
  sudo pacman --sync --noconfirm zsh
}

install_from_aur () {
  local package="$1"
  local tempdir="$(mktemp --directory)"
  git clone "https://aur.archlinux.org/${package}.git" $tempdir
  (cd $tempdir && makepkg --syncdeps --install --noconfirm)
  rm -rf $tempdir
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

