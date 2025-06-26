{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprshot
    hyprcursor
    hyprlock
    hyprwayland-scanner
    hyprland-protocols
  ];
}
