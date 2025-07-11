{ inputs, pkgs, config, ... }:
{
  imports = [
    ../modules/home/cli
    ../modules/home/desktop
  ];

  media = {
    spotify.enable = false;
    spicetify.enable = true;
  };

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
