{ pkgs, ... }:
{
  programs.element-desktop = {
    enable = true;
  };

  xdg.desktopEntries."element-desktop" = {
    name = "Element";
    exec = "${pkgs.element-desktop}/bin/element-desktop --password-store=gnome-libsecret";
    icon = "element-desktop";
    terminal = false;
    type = "Application";
  };
}
