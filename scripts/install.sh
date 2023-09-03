#!/usr/bin/env bash

trim_whitespace() {
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

expand() {
  local input="$1"
  if [[ -z "$input" ]]; then
    input="$(cat)"
  fi
  echo "$(eval echo "$input")"
}

process_links_prop_line() {
  [[ -z "$1" ]] && return 1
  local -r expanded_line="$(eval echo "\"${1}\"")"
  local -r src="$(echo "$expanded_line" | awk -F '=>' '{print $1}' | trim_whitespace)"
  local -r dst="$(echo "$expanded_line" | awk -F '=>' '{print $2}' | trim_whitespace)"
  ln --force --symbolic "$src" "$dst"
}

DOTFILES="$(cd "$(dirname "$0")/.." && pwd -P)"
find "$DOTFILES" -name 'links.prop' | while read -r filename; do
  while read -r line; do
    process_links_prop_line "$line"
  done < "$filename"
done
