{ pkgs, ... }:
{
  imports = [
    ./system
    ./nix.nix
    ./virtualisation.nix
    ./gaming.nix
    ./steam.nix
    ./programs.nix
    ./dev.nix
  ];

  environment.systemPackages = with pkgs; [
    swaynotificationcenter
    rofi
    libayatana-appindicator
    libayatana-indicator
    libappindicator
    libdbusmenu
    libdbusmenu-gtk2
    libdbusmenu-gtk3
    libadwaita
    trayer  
    eww
  ];
}
