{
  lib,
  config,
  ...
}: let
  cfg = config.hyprl.animations;
in {
  options.hyprl.animations.der-andere.enable = lib.mkEnableOption "enable der-andere animation";
  config = lib.mkIf cfg.der-andere.enable {
    wayland.windowManager.hyprland.settings.animations = {
      enabled = true;
      bezier = [
        "myBezier, 0.05, 0.9, 0.1, 1.05"
        "pace,0.46, 1, 0.29, 0.99"
        "overshot,0.13,0.99,0.29,1.1"
        "md3_decel, 0.05, 0.7, 0.1, 1"
      ];
      animation= [
        "windowsIn,1,6,md3_decel,slide"
        "windowsOut,1,6,md3_decel,slide"
        "windowsMove,1,6,md3_decel,slide"
        "fade,1,10,md3_decel"
        "workspaces,1,5,md3_decel,slidevert"
        "specialWorkspace,1,8,md3_decel,slide"
        "border,1,15,md3_decel"
      ];
    };
  };
}