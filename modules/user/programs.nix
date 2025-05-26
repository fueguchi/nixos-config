{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zed-editor
    nwg-look
    pavucontrol
    nautilus
    gimp
    yazi
    blueman
    cava
    brave
    thunderbird
  ];
}
