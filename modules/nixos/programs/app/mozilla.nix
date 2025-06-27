{ pkgs, pkgs-unstable, ... }:
{
  programs = {
    #firefox = {
    #  enable = true;
    #  package = pkgs.librewolf;
    #};
    thunderbird = {
      enable = true;
      package = pkgs.thunderbird;
    };
  };
}
