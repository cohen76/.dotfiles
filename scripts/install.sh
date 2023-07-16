#!/usr/bin/env bash

process_links_prop_line () {
  local line="$1"
  if [ -z "$line" ]; then
    return 1
  fi
  local src="$(eval echo "$line" | cut --delimiter '=' --fields 1)"
  local dst="$(eval echo "$line" | cut --delimiter '=' --fields 2)"
  echo "src='${src}' dst='${dst}'"
  # ln --symbolic "$src" "$dst"
}

DOTFILES=$(cd "$(dirname "$0")/.." && pwd -P)
find "$DOTFILES" -name 'links.prop' | while read -r filename; do
  while read -r line; do
    process_links_prop_line "$line"
  done < "$filename"
done

