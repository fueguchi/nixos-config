{ config, pkgs, ... }:
{
  home.pointerCursor = {
    enable = true;
    package = pkgs.yaru-theme;
    name = "Yaru-dark";
    size = 24;
    
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    
    cursorTheme = {
      name = "Yaru-dark";
      package = pkgs.yaru-theme;
      size = 24; 
    };
    
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    }; 
    
    font = {
      package = pkgs.fira;
      name = "Fira Sans";
      #size = "";
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
    ];
    exec-once = [
      "gsettings set org.gnome.desktop.interface cursor-theme '${config.home.pointerCursor.name}'"
      "gsettings set org.gnome.desktop.interface cursor-size '${toString config.home.pointerCursor.size}'"
    ];
  };

}
