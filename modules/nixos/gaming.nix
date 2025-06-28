{ pkgs, lib, config, ... }:
{
  options = {
    gaming.enable = lib.mkEnableOption "enable gaming module";
  };
  config = mk.If config.gaming.enable {
    environment.systemPackages = with pkgs; [
      prismlauncher
      heroic
    ];
  };
}
