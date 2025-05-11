{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "float,(org.pwmt.zathura)"
      "float,(blueman-manager-wrapped)"
      "float,(.protonvpn-app-wrapped)"
      "float,(org.pulseaudio.pavucontrol)"
      "suppressevent maximize, class:.*"
    ];
    windowrulev2 = [
      # fix some dragging issuse with xwayland
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

      # zathura
      "center,class:^(org.pwmt.zathura)$"
      "size 985 960,class:^(org.pwmt.zathura)$"

      # bluetooth manager
      "center,class:^(.blueman-manager-wrapped)$,title:^(Bluetooth)$"
      "float,class:^(.blueman-manager-wrapped)$,title:^(Bluetooth)$"
      "size 1150 750,class:^(.blueman-manager-wrapped)$,title:^(Bluetooth)$"

      # gtk file chooser
      "float,class:(xdg-desktop-portal-gtk),title:^(.*Files)$"
      "center,class:(xdg-desktop-portal-gtk),title:^(.*Files)$"
      "size 1150 750,class:(xdg-desktop-portal-gtk),title:^(.*Files)$"
      "float,class:(xdg-desktop-portal-gtk),title:^(.*Open)$"
      "center,class:(xdg-desktop-portal-gtk),title:^(.*Open)$"
      "size 1150 750,class:(xdg-desktop-portal-gtk),title:^(.*Open)$"
      "float,class:(xdg-desktop-portal-gtk),title:^(.*Save)$"
      "center,class:(xdg-desktop-portal-gtk),title:^(.*Save)$"
      "size 1150 750,class:(xdg-desktop-portal-gtk),title:^(.*Save)$"
      "float,class:(xdg-desktop-portal-gtk),title:^(.*discord.com)$"
      "size 1150 750,class:(xdg-desktop-portal-gtk),title:^(.*discord.com)$"
      "center,class:(xdg-desktop-portal-gtk),title:^(.*discord.com)$"

      # protonvpn gtk
      "float,class:(.protonvpn-app-wrapped),title:^(Proton)$"
      "size 400 600,class:^(.protonvpn-app-wrapped)$,title:^(Proton)$"
      "center,class:^(.protonvpn-app-wrapped)$,title:^(Proton)$"

      # discord file chooser
      "float,class:^(discord.*)$,title:^(Open.*)$"

      # waypaper
      "center,class:waypaper,title:waypaper"

      # pavucontrol
      "size 750 400,class:^(org.pulseaudio.pavucontrol),title:^(.*Volume)$"
      "center,class:^(org.pulseaudio.pavucontrol),title:^(.*Volume)$"

      # steam
      "float,class:(steam),title:^(Steam)$"
      "center,class:(steam),title^(Steam)$"
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
