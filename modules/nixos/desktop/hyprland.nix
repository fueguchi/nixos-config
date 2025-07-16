{ pkgs, inputs, ... }:
{
  programs.hyprland.enable = true;
  programs.hyprland.package = pkgs.hyprland;
}
