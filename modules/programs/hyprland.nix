{ inputs, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  envionment.systemPackages = with pkgs; [
    hyprshot
    hyprcursor
    hyprlock
    hypridle
    hyprwayland-scanner
    hyprland-protocols
  ];
}
