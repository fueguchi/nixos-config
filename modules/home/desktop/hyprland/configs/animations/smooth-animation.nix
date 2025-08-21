{
  lib,
  config,
  ...
}: let
  cfg = config.hyprl.animations;
in {
  options.hyprl.animations.smooth-animation.enable = lib.mkEnableOption "enable smooth animation";
  config = lib.mkIf cfg.smooth-animation.enable {
    wayland.windowManager.hyprland.settings.animations = {
      enabled = true;
      bezier = [
        "overshot,0.13,0.99,0.29,1.1"
      ];
      animation = [
        "windows,1,4,overshot,slide"
        "animation=fade,1,10,default"
        "animation=workspaces,1,8.8,overshot,slide"
        "animation=border,1,14,default"
      ];
    };
  };
}