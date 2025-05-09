{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nwg-look
    pavucontrol
    zathura
    nautilus
    gimp
    yazi
    blueman
    cava
    google-chrome
  ];
}
