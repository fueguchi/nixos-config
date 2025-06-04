{ pkgs, pkgs-unstable, ... }:
{
  imports = [ ./eww.nix ];
  environment.systemPackages = (with pkgs; [
    rofi
    ffmpeg-full
  ]) ++ (with pkgs-unstable; [
    spotify
  ]);
}
