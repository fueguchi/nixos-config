{ pkgs }:
{
  sddm-themes = pkgs.callPackage ./sddm-theme.nix { };
  nvim-plugins = pkgs.callPackage ./nvim-plugins.nix { };
}
