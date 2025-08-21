{
  lib,
  config,
  ...
}: let
  cfg = config.hyprl.animations;
in {
  options.hyprl.animations.sane1090x.enable = lib.mkEnableOption "enable sane1090x animation";
  config = lib.mkIf cfg.sane1090x.enable {
    wayland.windowManager.hyprland.settings.animations = {
      enabled = true;
      bezier = [ 
        "myBezier,0.05, 0.9, 0.1, 1.05"
      ];

      animation = [ 
        "windows, 1, 7, myBezier, slide"
        "windowsIn, 1, 7, myBezier, slide"
        "windowsOut, 1, 7, default, slide"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default, slidefadevert 20%"
      ];
    };
  };
}