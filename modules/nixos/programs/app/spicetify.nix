{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      spicetifyPackage = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".spicetify-cli;
      theme = spicePkgs.themes.comfy;
      colorScheme = "Spotify";
      experimentalFeatures = true;
    };
}
