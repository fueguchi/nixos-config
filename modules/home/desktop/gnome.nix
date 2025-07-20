{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zenity
    file-roller
    nautilus
    gnome-font-viewer
    qview    
    kdePackages.dolphin
  ];
}
