{
  environment = {
    variables = {
      EDITOR = "nvim";
      XDG_SESSION_TYPE = "wayland";
      SDL_VIDEODRIVER = "wayland,x11";
      GDK_BACKEND = "wayland,x11";
      CLUTTER_BACKEND = "wayland";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };
    sessionVariables = {
      ADW_DISABLE_PORTAL = "1";
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      ELECTRON_USE_WAYLAND = "1";
      STEAM_ENABLE_FEATURES = "UseOzonePlatform";
      STEAM_OZONE_PLATFORM = "wayland";
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };
  };
}
