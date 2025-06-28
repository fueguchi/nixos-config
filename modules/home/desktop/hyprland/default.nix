{ config, pkgs, lib, ... }:
{
  imports = [ ./config-1 ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.variables = [ "--all" ];
  };
}
