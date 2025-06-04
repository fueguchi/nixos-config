#!/usr/bin/env bash

  cd $HOME
  # installs oh-my-zsh. ( i don't use NixOS module because it is slow to me )
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
  # installs powerlevel10k.
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
  

