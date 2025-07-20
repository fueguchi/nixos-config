{ pkgs, ... }:
{
  imports = [
    ./theme
    ./swayosd
    ./zathura
    ./nixvim
    ./hyprland
#    ./zed.nix
    ./social.nix
    ./chromium.nix
    ./firefox.nix
    ./spotify.nix
    ./keyring.nix
    ./proton.nix
    ./bluetooth.nix
    ./gnome.nix
    ./discord.nix
    ./thunderbird.nix 
  ];

  home.packages = with pkgs; [
    burpsuite
    kdePackages.kdenlive
    gimp
    yt-dlp
    sqlitebrowser
    gnome-disk-utility
  ];
}
