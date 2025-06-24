{ pkgs, ... }:
{
  imports = [ ./themes/transparent.nix ];
  programs.zathura = {
    extraConfig = ''
      set selection-clipboard clipboard
    '';
    enable = true;
    package = pkgs.zathura;
  };
}
