{ config, lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ];

  intel.enable = true;
  laptop.enable = true;
  keyring.enable = true;

  users.users.erik = {
    isNormalUser = true;
    description = "erik";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "video" "input" ];
  };

  system.stateVersion = "24.11"; # just don't change if u don't know what you're doing
}
