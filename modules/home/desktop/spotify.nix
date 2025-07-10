{ pkgs, pkgs-unstable, lib, inputs, config, ... }:
{
  options = {
    spotifyconf = {
      spicetify.enable = lib.mkEnableOption "enable spicetify module";
      spotify.enable = lib.mkEnableOption "enable spotify module";
    };
  };
  config = { 
    programs.spicetify = lib.mkIf config.spotifyconf.spicetify.enable (
      
      let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system}; 
      in

      {
        enable = true;
        theme = spicePkgs.themes.text;
        enabledExtensions = with spicePkgs.extensions; [
          # add extensions to spicetify
        ];
        colorScheme = "Spotify";
        experimentalFeatures = true;
      });
    home.packages = lib.mkIf config.spotifyconf.spotify.enable (with pkgs-unstable; [ spotify-player spotify ]);
  };
}
