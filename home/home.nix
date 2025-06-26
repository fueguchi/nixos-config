{ inputs, pkgs, config, ... }:
{
  imports = [
    ../modules/home/programs
    ../modules/home/desktop
    ../modules/home/system
  ];
  home = {
    username = "erik";
    homeDirectory = "/home/erik";
  };
  
  nixpkgs.config = {
    allowUnfree = true;
    chromium.enableWideVine = true;
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
