{ pkgs, pkgs-unstable, lib, inputs, ... }:
{
  options = {
    spicetify.enable = lib.mkEnableOption "enable spicetify module";
  };
  config = lib.mkIf config.spicetify.enable {
    #imports = [ spicetify-nix.homeManagerModules.spicetify ];
    programs.spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system}; in
      {
      enable = true;
      theme = spicePkgs.themes.comfy;
      enabledExtensions = with spicePkgs.extensions; [
      ];
      colorScheme = "Spotify";
      experimentalFeatures = true;
    };
  };
  options = {
    spotify.enable = lib.mkEnableOptions "enable spotify module";
  };
  config = lib.mkIf config.spotify.enable {
    home.packages = with pkgs-unstable; [
      spotify
    ];
  };
}
