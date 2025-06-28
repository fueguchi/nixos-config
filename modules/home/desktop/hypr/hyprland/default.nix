{ config, pkgs, lib, ... }:
{
  options = {
    hyprland.enable = lib.mkEnableOption "Enable Hyprland";
  };
  config = lib.mkIf config.hyprland.enable {
    imports = [ ./config-1 ];
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.variables = [ "--all" ];
    };
  };
}
