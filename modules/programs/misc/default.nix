{ pkgs, pkgs-unstable, ... }:
{
  imports = [ ./eww.nix ];
  programs = {
    noisetorch.enable = true;
  };
  environment.systemPackages = (with pkgs; [
    rofi
    pywal
    vscode
    gnome-font-viewer
    ffmpeg-full
  ]) ++ (with pkgs-unstable; [
    spotify
  ]);
}
