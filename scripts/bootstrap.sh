#!/usr/bin/env bash

function trim_whitespace() {
  local input="$1"
  if [[ -z "$input" ]]; then
    input="$(cat)"
  fi
  local -r l_whitespace="${input%%[![:space:]]*}"
  local -r r_whitespace="${input##*[![:space:]]}"
  input="${input##${l_whitespace}}"
  input="${input%%${r_whitespace}}"
  echo "$input"
}

function expand() {
  local input="$1"
  if [[ -z "$input" ]]; then
    input="$(cat)"
  fi
  echo "$(eval echo "$input")"
}

function process_links_prop_line() {
  local input="$1"
  if [[ -z "$input" ]]; then
    input="$(cat)"
  fi
  local -r src="$(echo "$input" | awk -F '=>' '{print $1}' | trim_whitespace | expand)"
  local -r dst="$(echo "$input" | awk -F '=>' '{print $2}' | trim_whitespace | expand)"
  mkdir --parents "$(dirname "$dst")"
  ln --force --symbolic "$src" "$dst"
}

DOTFILES="$(cd "$(dirname "$0")/.." && pwd -P)"
find "$DOTFILES" -name 'links.prop' | while read -r filename; do
  while read -r line; do
    process_links_prop_line "$line"
  done < "$filename"
done
