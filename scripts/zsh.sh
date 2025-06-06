#!/usr/bin/env bash

cd $HOME
# installs oh-my-zsh. ( i don't use NixOS module because it is slow to me )
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "Oh-my-zsh not found. Installing..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh-my-zsh already installed, skiping."
fi

if [[ ! -e "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]]; then
  echo "P10k notfound. Cloning repository..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
  else 
echo "P10k is already cloned."
fi



