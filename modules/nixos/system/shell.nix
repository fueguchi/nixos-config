{ pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    promptInit = ''
     if [[ -r "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
      nr() {
        if [ -d "$HOME/.dotfiles" ]; then
          (cd "$HOME/.dotfiles" && sudo nixos-rebuild switch --flake .#)
        else
          echo "Error: ~/.dotfiles not found." >&2
          return 1
        fi
      }
      hmsw() {
        if [ -d "$HOME/.dotfiles" ]; then
          (cd "$HOME/.dotfiles" && home-manager switch --flake .#erik@wired)
        else
          echo "Error: ~/.dotfiles not found." >&2
          return 1
        fi
      }
  '';
  };
  users.defaultUserShell = pkgs.zsh;
  environment.shells = [ pkgs.zsh ];
}
