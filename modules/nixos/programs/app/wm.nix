{ pkgs, ... }:
{
  # some packages that can be usefull to window managers
  environment.systemPackages = with pkgs; [
    swaynotificationcenter
    nwg-look
    grim
    wl-clipboard
    slurp
    swww
    pavucontrol
    yazi
    blueman
    imagemagick
    brightnessctl
  ];
}
