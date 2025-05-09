{ pkgs, ... }:
{
  imports = [
    ./steam.nix
  ];
  environment.systemPackages = with pkgs; [
    pokemmo-installer
    heroic
  ];
}
