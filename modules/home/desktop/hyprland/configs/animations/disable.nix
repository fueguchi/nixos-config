{
  lib,
  config,
  ...
}: let
  cfg = config.hyprl.animations;
in {
  options.hyprl.animations.disable = lib.mkEnableOption "disable animation";
  config = lib.mkIf cfg.disable {
    wayland.windowManager.hyprland.settings.animations = {
      enabled = false;
    };
  };
}