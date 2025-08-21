{ inputs, pkgs, lib, config, ... }:
{
  options.desktop.hyprland.enable = lib.mkEnableOption "enable hyprland module";
  config = lib.mkIf config.desktop.hyprland.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };
}
