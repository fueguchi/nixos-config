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

powerlvl10k () {
  if [[ ! -e "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]]; then
    echo "P10k notfound. Cloning repository..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    else 
  echo "P10k is already cloned."
  fi
}

powerlvl10k
directory_creation

exit 0
