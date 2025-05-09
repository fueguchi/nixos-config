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

  programs.git.enable = true;

  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
