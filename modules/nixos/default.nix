{ pkgs, ... }:
{
  imports = [
    ./system
    ./nix.nix
    ./dev.nix
    ./gaming.nix
    ./programs.nix
    ./virtualisation.nix
  ];

  environment.systemPackages = with pkgs; [
    swaynotificationcenter
    rofi-wayland
    libayatana-appindicator
    libayatana-indicator
    libappindicator
    libdbusmenu
    libdbusmenu-gtk2
    libdbusmenu-gtk3
    libadwaita
    trayer  
    eww
    ffmpeg-full
    wf-recorder
  ];
}
