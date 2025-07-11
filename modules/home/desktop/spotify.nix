{ pkgs, pkgs-unstable, lib, inputs, config, ... }:
{
  options.media = {
    spicetify.enable = lib.mkEnableOption "enable spicetify module";
    spotify.enable = lib.mkEnableOption "enable spotify module";
  };
  config = { 
    programs.spicetify = lib.mkIf config.media.spicetify.enable 
    (let 
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system}; 
    in {
      enable = true;
      spicetifyPackage = pkgs-unstable.spicetify-cli;
      spotifyPackage = pkgs-unstable.spotify;
      experimentalFeatures = true;
      alwaysEnableDevTools = true;
    });
    home.packages = lib.mkIf config.media.spotify.enable 
    (with pkgs-unstable; [ 
      spotify-player 
      spotify ]);
  };
}
