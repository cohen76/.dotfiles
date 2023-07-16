#!/usr/bin/env bash

make_symlink () {
  local SRC=${1}
  local DST=${2}
  ln --symbolic ${SRC} ${DST}
}

process_links () {
  local FILENAME="${1}"
  echo "FILENAME=${FILENAME}"
  cat "${FILENAME}"
}

DOTFILES=$(cd "$(dirname "${0}")/.." && pwd -P)
find "${DOTFILES}" -name 'links.prop' | while read filename; do
    
done

echo $(eval echo '$DOTFILES/git/gitignore=$HOME/.gitignore' | cut --delimiter '=' --fields 1)
echo $(eval echo '$DOTFILES/git/gitignore=$HOME/.gitignore' | cut --delimiter '=' --fields 2)
