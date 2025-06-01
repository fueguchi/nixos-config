{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nwg-look
    pavucontrol
    nautilus
    gimp
    yazi
    blueman
    cava
    thunderbird
  ];
}
