{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  #imports = [ spicetify-nix.homeManagerModules.spicetify ];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.comfy;
    enabledExtensions = with spicePkgs.extensions; [
    ];
    colorScheme = "Spotify";
    experimentalFeatures = true;
  };
}
