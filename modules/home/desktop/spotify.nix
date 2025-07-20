{ pkgs, lib, inputs, config, ... }:
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
      spicetifyPackage = pkgs.spicetify-cli;
      spotifyPackage = pkgs.spotify;
      experimentalFeatures = true;
      alwaysEnableDevTools = true;
    });
    home.packages = lib.mkIf config.media.spotify.enable 
    (with pkgs; [ 
      spotify-player 
      spotify ]);
  };
}
