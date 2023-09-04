#!/usr/bin/env bash

function install_from_aur() {
  [[ -n "$1" ]] && local -r package="$1" || local -r package="$(cat)"
  local -r tempdir="$(mktemp --directory --tmpdir="$(pwd)" 'install_from_aur.XXXXXX')"
  if ! git clone "https://aur.archlinux.org/${package}.git" "$tempdir"; then 
    echo "install_from_aur: git clone: ${package}: no such package or network issue"
    return 1
  fi
  if ! (cd "$tempdir" && makepkg --syncdeps --install --noconfirm); then 
    echo "install_from_aur: makepkg: ${package}: failed to build or install package"
    return 1
  fi
  rm --recursive --force "$tempdir"
}

function install_programs() {
  sudo pacman --sync --noconfirm 'browserpass-chromium'
  sudo pacman --sync --noconfirm 'browserpass'
  sudo pacman --sync --noconfirm 'discord'
  sudo pacman --sync --noconfirm 'git'
  sudo pacman --sync --noconfirm 'keychain'
  sudo pacman --sync --noconfirm 'man-db'
  sudo pacman --sync --noconfirm 'neofetch'
  sudo pacman --sync --noconfirm 'neovim'
  sudo pacman --sync --noconfirm 'pass'
  sudo pacman --sync --noconfirm 'pinentry'
  sudo pacman --sync --noconfirm 'pnpm'
  sudo pacman --sync --noconfirm 'python-pip'
  sudo pacman --sync --noconfirm 'qt5-base'
  sudo pacman --sync --noconfirm 'rustup'
  sudo pacman --sync --noconfirm 'zsh'

  install_from_aur 'paru-bin'
  paru --sync --noconfirm 'brave-bin'
  paru --sync --noconfirm 'vscodium-bin'
}

function config_system() {
  sudo chsh --shell "$(which zsh)"

  # sets tab & shift + tab to navigate between terminal tabs
  gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab'
  gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
}

function setup_arch() {
  install_programs
  config_system
}
