{ pkgs, pkgs-unstable, ... }:
{
  imports = [ ./eww.nix ];
  programs = {
    noisetorch.enable = true;
  };
  environment.systemPackages = (with pkgs; [
    rofi
    pywal
    gnome-font-viewer
    ffmpeg-full
  ]) ++ (with pkgs-unstable; [
    spotify
  ]);
}
