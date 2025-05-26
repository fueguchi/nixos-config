{ pkgs, ... }:
{
  imports = [ ./themes/transparent.nix ];
  programs.zathura = {
    enable = true;
    package = pkgs.zathura;
  };
}
