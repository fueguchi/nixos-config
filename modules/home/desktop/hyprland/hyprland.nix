{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./configs/first 
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;
  };
}
