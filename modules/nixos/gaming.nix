{ pkgs, lib, config, ... }:
{
  options.gaming.enable = lib.mkEnableOption "enable gaming module";
  config = lib.mkIf config.gaming.enable {
    environment.systemPackages = with pkgs; [
      prismlauncher
      heroic
    ];
  };
}
