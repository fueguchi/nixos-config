{ pkgs, pkgs-unstable, ... }:
{
  imports = [ ./eww.nix ];
  environment.systemPackages = (with pkgs; [
    rofi
    ffmpeg-full
    gitui
  ]) ++ (with pkgs-unstable; [
    spotify
  ]);
}
