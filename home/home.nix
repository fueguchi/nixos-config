{ pkgs, config, ... }:
{
  imports = [
    ./programs
    ./desktop
  ];
  home = {
    username = "erik";
    homeDirectory = "/home/erik";
  };
  
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
