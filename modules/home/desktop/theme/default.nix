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
    size = 28;
    
    gtk.enable = true;
    x11.enable = true;
  };

  gtk.enable = true;
    
  gtk.iconTheme = {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
  }; 

  gtk.font = {
    package = pkgs.noto-fonts;
    name = "Noto Sans";
    size = 12;
  };

  gtk.theme = {
    package = pkgs.gnome-themes-extra;
    name = "Adwaita-dark";
  };

  gtk.gtk2 = {
    extraConfig = "gtk-application-prefer-dark-theme = true";
  };

  gtk.gtk3 = {
    extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  gtk.gtk4 = {
    extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "Adwaita";
    style = {
      name = "Adwaita";
      package = pkgs.adwaita-qt;
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
}
