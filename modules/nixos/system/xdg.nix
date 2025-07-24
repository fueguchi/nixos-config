{ pkgs, ... }:
{
  xdg.portal = { 
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
      xdg-desktop-portal-termfilechooser
    ];
    config = {
      common = {
        default = [ "*" ]; 
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
      hyprland = {
        preferred = [ "hyprland" "gtk" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
    };
  };
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];
      "image/png" = [ "com.interversehq.qView" ];
    };
  };
  environment.systemPackages = with pkgs; [
    xdg-utils
    xdg-user-dirs
    xdg-user-dirs-gtk
  ];
}
