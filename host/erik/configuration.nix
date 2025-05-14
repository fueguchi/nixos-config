{ config, lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ];

  intel.enable = true;
  laptop.enable = true;
  keyring.enable = true; # if you use a DE just disable this

  users.users.erik = {
    isNormalUser = true;
    description = "erik";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "video" "input" ];
  };
  console.keyMap = "br-abnt2";
  programs.git.enable = true;
  system.stateVersion = "24.11"; # just don't change if u don't know what you're doing
}
