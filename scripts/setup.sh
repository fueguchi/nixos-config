#!/usr/bin/env bash

DIRECTORIES=("$HOME/Downloads" 
             "$HOME/Documents" 
             "$HOME/Music" 
             "$HOME/Pictures" 
             "$HOME/Public" 
             "$HOME/Videos")

directory_creation () {
  local SYM_DIR="$HOME/.config/.sym"
  if [[ ! -d "${SYM_DIR}" ]]; then
    mkdir -p "${SYM_DIR}"
    echo "${SYM_DIR} created."
  else
    echo "${SYM_DIR} already exist."
  fi
}

xdg () {
  for dir in "${DIRECTORIES[@]}"; do
    if [[ ! -d "$dir" ]]; then
      xdg-user-dirs-update
    else 
      xdg-user-dirs-gtk-update
    fi
  done
}

xdg
directory_creation

exit 0
