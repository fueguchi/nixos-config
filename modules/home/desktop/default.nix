{ pkgs, ... }:
{
  imports = [
    ./hypr
    ./theme
    ./ags
    ./swayosd
    ./zathura
    ./nixvim
    ./chromium.nix
    ./firefox.nix
    ./spotify.nix
    ./keyring.nix
    ./proton.nix
    ./bluetooth.nix
    ./gnome.nix
    ./discord.nix
    ./thunderbird.nix
    ./element.nix
  ];

  home.packages = with pkgs; [
    blender
    gimp
    yt-dlp
    sqlitebrowser
    telegram-desktop
  ];
}
