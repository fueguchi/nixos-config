#!/usr/bin/env bash

cd $HOME
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "omz not found. Installing..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
else
  echo "omz already installed, skiping."
fi

if [[ ! -e "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]]; then
  echo "p10k not found. Cloning repository..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
  else 
echo "p10k is already cloned."
fi
