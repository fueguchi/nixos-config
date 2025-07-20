{ pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ga = "git add";
      gc = "git commit";
      gs = "git status";
      ".d" = "cd $HOME/.dotfiles";
    };
    initContent = lib.mkBefore ''
      unalias ls 2>/dev/null
      alias ls='eza --icons'
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      custom = "$HOME/.oh-my-zsh/custom/";
      theme = "powerlevel10k/powerlevel10k";
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./p10k-config;
        file = "p10k.zsh";
      }
    ]; 
  };
}
