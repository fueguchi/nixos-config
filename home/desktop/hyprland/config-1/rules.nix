{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # fix some dragging issuse with xwayland
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      
      # idk but hyprland recommends in default conf
      "suppressevent maximize, class:.*"
      # zathura
      "float, class: org.pwmt.zathura"
      "center, class: org.pwmt.zathura"
      "size 985 960, class: org.pwmt.zathura"

      # bluetooth manager
      "center, class: .blueman-manager-wrapped, title: Bluetooth"
      "float, class: .blueman-manager-wrapped, title: Bluetooth"
      "size 1150 750, class: .blueman-manager-wrapped, title: Bluetooth"

      # nautilus
      "center, class: org.gnome.Nautilus"
      "float, class: org.gnome.Nautilus"
      "size 1150 750, class: org.gnome.Nautilus"

      # gtk file chooser
      "float, class: xdg-desktop-portal-gtk"
      "center, class: xdg-desktop-portal-gtk"
      "size 1150 750, class: xdg-desktop-portal-gtk"

      # protonvpn gtk
      "float, class: .protonvpn-app-wrapped, title: Proton"
      "size 400 600, class: .protonvpn-app-wrapped, title: Proton"
      "center, class: .protonvpn-app-wrapped, title: Proton"

      # discord file chooser
      "float, class:discord, initialTitle:Open"

      # waypaper
      "center,class:waypaper,title:waypaper"

      # pavucontrol
      "float, class: org.pulseaudio.pavucontrol"
      "size 750 400, class: org.pulseaudio.pavucontrol"
      "center, class: org.pulseaudio.pavucontrol"
    ];

    layerrule = [
      "noanim,selection"
      "blur,rofi"
      "blur,menu"
      "blur,gtk-layer-shell"
      "animation popin 95%,rofi"
      "ignorezero,gtk-layer-shell"
    ];
  };
}
