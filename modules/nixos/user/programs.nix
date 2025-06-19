{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nwg-look
    pavucontrol
    gimp
    yazi
    blueman
    cava
  ];
}
