{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal-hyprland
    ];
    config.common.default = "*";
  };
  environment.systemPackages = with pkgs; [
    xdg-utils
    xdg-user-dirs
    xdg-user-dirs-gtk
  ];
}
