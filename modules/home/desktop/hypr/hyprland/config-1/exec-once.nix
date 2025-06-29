{
  wayland.windowManager.hyprland.settings.exec-once = [
    "gnome-keyring-daemon --start --components=secrets"
    "swww-daemon"
    "swww & waypaper --restore"
    "nm-applet"
    "rfkill unblock bluetooth"
    "eww open bar"
    "systemctl stop zerotierone"
  ];
}
