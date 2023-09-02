#!/usr/bin/env bash

sanitize_filename() {
  local input="$1"
  if [[ -z "$input" ]]; then
    echo "sanitize_filename: string argument expected"
    return 1
  fi
  input="${input## }"                # trim leading whitespace
  input="${input%% }"                # trim trailing whitespace
  input="${input// /_}"              # replace spaces with underscores
  input="${input//[^a-zA-Z0-9._-]/}" # remove problematic characters
  echo "$input"
}

setup_github_ssh_key() {
  local email passphrase
  read -rp  'email:      ' email
  read -rsp 'passphrase: ' passphrase
  echo && echo

  local -r keyname="$(sanitize_filename "github__${email//@/_at_}")"
  local -r keyfile="${HOME}/.ssh/${keyname}"
  local -r publickey="${keyfile}.pub"

  echo "Generating SSH key"
  ssh-keygen -q -t ed25519 -C "$email" -f "$keyfile" -N "$passphrase"
  echo

  echo "Paste the following into https://github.com/settings/ssh/new"
  echo "$(whoami)@$(uname -n)"
  cat  "$publickey"
  echo

  echo 'Add the following line to your shell profile (e.g., .zshenv or .bash_profile):'
  echo 'eval $(keychain --eval --agents ssh' "'${keyname}')"
  echo

  echo 'Use the follow command to configure git to globally use ssh instead of https:'
  echo 'git config --global url.ssh://git@github.com/.insteadOf https://github.com/'
}

setup_github_ssh_key
