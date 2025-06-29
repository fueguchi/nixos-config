{ inputs, pkgs, config, ... }:
{
  imports = [
    ../modules/home/cli
    ../modules/home/desktop
  ];

  spotifyconf = {
    spotify.enable = true;
    spicetify.enable = false;
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
