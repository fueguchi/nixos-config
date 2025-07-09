{ pkgs, lib, config, inputs, ... }:
{
  options.gaming.enable = lib.mkEnableOption "enable gaming module";
  config = lib.mkIf config.gaming.enable {
    environment.systemPackages = with pkgs; [
      prismlauncher
      heroic
      inputs.nix-gaming.packages.${pkgs.system}.osu-stable
      dxvk_2

      # mod manager
      r2modman
    ];
  };
}
