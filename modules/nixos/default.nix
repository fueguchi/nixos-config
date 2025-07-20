{ pkgs, ... }:
{
  imports = [
    
    ./system
    ./desktop
    
    ./git.nix
    ./nix.nix
    ./dev.nix
    ./gaming.nix
    ./programs.nix
    ./quickshell.nix
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
    programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-volman
      thunar-vcs-plugin
      thunar-media-tags-plugin
      thunar-archive-plugin
      ];
  };
}
