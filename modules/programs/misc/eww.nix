{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libayatana-appindicator
    libayatana-indicator
    libappindicator
    libdbusmenu
    libdbusmenu-gtk2
    libdbusmenu-gtk3
    libadwaita
    eww
  ];
}
