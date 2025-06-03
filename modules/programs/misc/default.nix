{ pkgs, pkgs-unstable, ... }:
{
  imports = [ ./eww.nix ];
  programs = {
    noisetorch.enable = true;
  };
  environment.systemPackages = (with pkgs; [
    rofi
    pywal
    ffmpeg-full
  ]) ++ (with pkgs-unstable; [
    spotify
  ]);
}
