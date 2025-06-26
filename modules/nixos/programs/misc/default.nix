{ pkgs, pkgs-unstable, ... }:
{
  imports = [ ./eww.nix ];
  environment.systemPackages = (with pkgs; [
    rofi
    ffmpeg-full
    gimp
    spotify-player
    glib
    gobject-introspection
    gjs
    gtk4
    gtk4.dev
    gtk4-layer-shell
  ]) ++ (with pkgs-unstable; [
    spotify
  ]);
}
