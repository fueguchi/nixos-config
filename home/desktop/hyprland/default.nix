{ config, pkgs, lib, ... }:
{
  imports = [ ./config-1 ];
  home.packages = with pkgs; [
    hyprshot
    hyprcursor
    hyprlock
    hypridle
    hyprwayland-scanner
    hyprland-protocols
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.variables = [ "--all" ];
  };
}
