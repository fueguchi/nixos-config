{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ga = "git add";
      gc = "git commit";
      gs = "git status";
      ".d" = "cd $HOME/.dotfiles";
      ls = "eza --icons -F";
    };
  };
  programs.zsh.interactiveShellInit = ''
    nr() {
      if [ -d "$HOME/.dotfiles" ]; then
        (cd "$HOME/.dotfiles" && sudo nixos-rebuild switch --flake .#)
      else
        echo "Error: ~/.dotfiles directory not found." >&2
        return 1
      fi
    }
  '';
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
}
