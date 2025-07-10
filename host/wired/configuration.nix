{ config, lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    ];

  intel.enable = true;
  laptop.enable = true;
  keyring.enable = true; 
  vm.enable = false;
  gaming = {
    osu.enable = true;
    steam.enable = true;
    r2mod.enable = true;
    heroic.enable = true;
    gamemode.enable = true;
    minecraft.enable = false;
  };


  users.users.erik = {
    isNormalUser = true;
    description = "erik";
    extraGroups = [ "gamemode" "networkmanager" "wheel" "libvirtd" "video" "input" ];
  };

  console.keyMap = "br-abnt2";
  programs.git.enable = true;
  programs.git.config.credential.helper = "manager";
  environment.systemPackages = [ pkgs.git-credential-manager ];
  system.stateVersion = "25.05"; # just don't change if u don't know what you're doing
}
