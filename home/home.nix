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
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
