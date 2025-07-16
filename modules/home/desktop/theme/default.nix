{ config, pkgs, ... }:
{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  home.pointerCursor = {
    enable = true;
    package = pkgs.capitaine-cursors;
    name = "capitaine-cursors";
    size = 32;
    
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    
    iconTheme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-icon-theme;
    }; 

    font = {
      package = pkgs.noto-fonts;
      name = "Noto Sans";
      #size = 13;
    };

    theme = {
      package = pkgs.colloid-gtk-theme;
      name = "Colloid-Dark";
    };

    gtk2 = {
      extraConfig = "gtk-application-prefer-dark-theme = true";
    };

    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };

    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
  };
  
  wayland.windowManager.hyprland.settings = {
    env = [
      "HYPRCURSOR_THEME,${config.home.pointerCursor.name}"
      "HYPRCURSOR_SIZE,${toString config.home.pointerCursor.size}"
      "XCURSOR_THEME,${config.home.pointerCursor.name}"
      "XCURSOR_SIZE,${toString config.home.pointerCursor.size}"
    ];
    exec-once = [
      "gsettings set org.gnome.desktop.interface cursor-theme '${config.home.pointerCursor.name}'"
      "gsettings set org.gnome.desktop.interface cursor-size '${toString config.home.pointerCursor.size}'"
    ];
  };
  home.packages = with pkgs; [
    nwg-look
  ];
}
