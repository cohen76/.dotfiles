#!/usr/bin/env bash

function sanitize_filename() {
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

function setup_github_ssh_key() {
  local comment passphrase
  read -rp  'comment:    ' comment
  read -rsp 'passphrase: ' passphrase
  echo && echo

  local -r keyname="$(sanitize_filename "github_${comment}")"
  local -r keyfile="${HOME}/.ssh/${keyname}"
  local -r publickey="${keyfile}.pub"

  echo 'Generating SSH key'
  ssh-keygen -q -t ed25519 -C "$comment" -f "$keyfile" -N "$passphrase"
  echo
  echo 'Submit the following into the form at https://github.com/settings/ssh/new:'
  echo 'Title:'
  echo "$(whoami)@$(uname -n)"
  echo
  echo 'Key type:'
  echo 'Authentication Key'
  echo
  echo 'Key:'
  cat  "$publickey"
  echo
  echo 'Add the following line to your shell profile (e.g., .zshenv or .bash_profile):'
  echo 'eval $(keychain --quiet --eval --agents ssh' "'${keyname}')"
  echo
  echo 'To test your setup run the following command:'
  echo 'ssh -T git@github.com'
}

setup_github_ssh_key
