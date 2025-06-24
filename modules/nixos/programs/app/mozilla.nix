{ pkgs, pkgs-unstable, ... }:
{
  imports = [
    ./firefox.nix
  ];
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox;
    };
    thunderbird = {
      enable = true;
      package = pkgs.thunderbird;
    };
  };
}
