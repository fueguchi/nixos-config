{ pkgs, ... }:
{
  # some packages that can be usefull to window managers
  environment.systemPackages = with pkgs; [
    swaynotificationcenter
    waypaper
    nwg-look
    grim
    wl-clipboard
    slurp
    swww
    imagemagick
  ];
}
