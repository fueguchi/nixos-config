{ pkgs, ... }:
{
  # some packages that can be usefull to window managers
  environment.systemPackages = with pkgs; [
    swww
    swaynotificationcenter
    waypaper
    nwg-look
    grim
    slurp
  ];
}
