{
  wayland.windowManager.hyprland.settings = {
    xwayland = {
      force_zero_scaling = true;
    };
    decoration = {
      rounding = 0;
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
        enabled = true;
        size = 4;
        passes = 2;
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
      #disable_splash_render = true;
    };

    gestures = {
      workspace_swipe = false;
    };

    dwindle = {
      pseudotile = true;
      force_split = 0;
      default_split_ratio = 1.0;
      special_scale_factor = 0.8;
      split_width_multiplier = 1.0;
      use_active_for_splits = true;
      preserve_split = true;
    };
    source = "~/.cache/wal/hypr.conf";
    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      "col.active_border" = "$color1 45deg";
      "col.inactive_border" = "$color0";
      resize_on_border = false;
      allow_tearing = false;
      layout = "dwindle";
    };
  };
}
