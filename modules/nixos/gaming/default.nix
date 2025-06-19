{ pkgs, ... }:
{
  imports = [
    ./steam.nix
  ];
  environment.systemPackages = with pkgs; [
    prismlauncher
    heroic

    # can be useful
    jre21_minimal
  ];
}
