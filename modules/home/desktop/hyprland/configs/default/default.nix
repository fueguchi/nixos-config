{
  imports = [
    ./binds.nix
    ./rules.nix
    ./inputs.nix
    ./monitor.nix
    ./exec-once.nix
    ../animations
  ];

  wayland.windowManager.hyprland.settings = {
    cursor = {
      no_hardware_cursors = true;
    };
    xwayland = {
      force_zero_scaling = true;
    };
    decoration = {
      rounding = 20;
      active_opacity = 1;
      inactive_opacity = 1;

      shadow = {
        enabled = false;
        range = 20;
        render_power = 4;
        ignore_window = true;
        #color = "rgba(000000b3)";
        #color_inactive = "0x50000000";
      };

      blur = {
        enabled = false;
        size = 10;
        passes = 4;
        vibrancy = 0.1696;
        brightness = 0.8172;
        #contrast = 1;
        noise = 0.0100;
        new_optimizations = true;
        ignore_opacity = true;
        xray = false;
      };
    };

    misc = {
      vfr = true;
      vrr = 0;
      disable_hyprland_logo = true;
      force_default_wallpaper = 0; 
    };

    gestures = {
      workspace_swipe = false;
    };

    dwindle = {
      pseudotile = false;
      force_split = 0;
      default_split_ratio = 1.0;
      special_scale_factor = 1.0;
      split_width_multiplier = 1.0;
      use_active_for_splits = true;
      preserve_split = false;
    };

    source = "~/.cache/wal/hypr.conf";

    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 2;
      "col.active_border" = "$color1 45deg";
      "col.inactive_border" = "$color0";
      resize_on_border = false;
      allow_tearing = false;
      layout = "dwindle";
    };
  };
}
