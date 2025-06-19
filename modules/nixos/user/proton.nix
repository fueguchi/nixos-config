{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    protonvpn-gui
    #protonmail-desktop
  ];
}
