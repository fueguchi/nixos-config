{ pkgs, pkgs-unstable, ... }:
{
  imports = [ ./eww.nix ];
  environment.systemPackages = (with pkgs; [
    rofi
    ffmpeg-full
    gitui
    chromium
    spotify-player
  ]) ++ (with pkgs-unstable; [
    spotify
  ]);
}
