{ pkgs, ... }:
{
  nix = {
    settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    warn-dirty = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  environment.systemPackages = [ 
    pkgs.nix-prefetch
    pkgs.nix-prefetch-github
  ];
  nixpkgs.config.allowUnfree = true;
}
