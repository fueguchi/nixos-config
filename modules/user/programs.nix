{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zed-editor
    nwg-look
    pavucontrol
    zathura
    nautilus
    gimp
    yazi
    blueman
    cava
    brave
    thunderbird
  ];
}
