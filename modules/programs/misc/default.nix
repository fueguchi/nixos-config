{ pkgs, pkgs-unstable, ... }:
{
  imports = [ ./eww.nix ];
  environment.systemPackages = (with pkgs; [
    rofi
    ffmpeg-full
    gitui
    spotify-player
  ]) ++ (with pkgs-unstable; [
    spotify
  ]);
}
