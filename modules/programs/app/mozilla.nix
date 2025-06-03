{ pkgs, pkgs-unstable, ... }:
{
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
