{
  config,
  pkgs,
  ...
}: {
  xdg.enable = true;
  xdg.userDirs = let
    homeDir = path: "${config.home.homeDirectory}/${path}";
  in {
    enable = true;
    createDirectories = true;
    desktop = homeDir "Desktop";
    download = homeDir "Downloads";
    documents = homeDir "Documents";
    videos = homeDir "Videos";
    pictures = homeDir "Pictures";
    music = homeDir "Music";
    templates = homeDir "Templates";
    publicShare = homeDir "PublicShare";
    extraConfig = {
      XDG_SYM_DIR = homeDir ".config/.sym";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
      xdg-desktop-portal-termfilechooser
    ];
    config = {
      common = {
        default = [ "*" ];
        "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
      };
      hyprland = {
        preferred = [ "hyprland" "gtk" ];
        "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
      };
    };
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];
      "image/png" = [ "com.interversehq.qView" ];
    };
  };
  home.packages = with pkgs; [
    xdg-utils
    xdg-user-dirs
    xdg-user-dirs-gtk
  ];
}
