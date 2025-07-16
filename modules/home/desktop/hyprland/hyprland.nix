{ config, pkgs, lib, ... }:
{
  imports = [ ./configs/first ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;
    #systemd.variables = [ "--all" ];
  };
}
