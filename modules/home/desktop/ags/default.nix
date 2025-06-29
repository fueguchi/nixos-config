{ inputs, config, lib, pkgs-unstable, system, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = {
    enable = true;
    configDir = ./config;
    extraPackages = with pkgs-unstable; [
      inputs.ags.packages.${system}.battery
      inputs.ags.packages.${system}.astal4
      fzf
      gjs
      glib
      gobject-introspection
      gjs
      gtk4
      gtk4.dev
      gtk4-layer-shell
    ];
  };
  home.packages = [ inputs.astal.packages.${system}.default ];
}
