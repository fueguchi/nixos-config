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
  ];

  home.packages = with pkgs; [
    gimp
  ];
}
