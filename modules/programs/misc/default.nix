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
    ffmpeg-full
  ]) ++ (with pkgs-unstable; [
    spotify
  ]);
}
