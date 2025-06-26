{ pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ga = "git add";
      gc = "git commit";
      gs = "git status";
      ".d" = "cd $HOME/.dotfiles";
      ez = "eza --icons";
    };
  };
  programs.zsh.interactiveShellInit = ''
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
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
}
