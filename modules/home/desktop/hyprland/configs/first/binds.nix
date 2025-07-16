{
  wayland.windowManager.hyprland.settings = {
      bind = [
      # some basic use binds
      "SUPER, E, exec, kitty yazi"
      "SUPER, PRINT, exec, hyprshot -m region --freeze"
      "SUPER, T, exec, /home/erik/.dotfiles/modules/home/desktop/hyprland/common/scripts/wallpaper.sh" # unfortunelly i can't write this script with writeShellScriptBin to be more reproducible
      "SUPER, Q, exec, kitty"
      "SUPER, R, exec, rofi -show"
      "SUPER, Y, exec, kitty nvim"
      "SUPER, L, exec, nautilus"

      # bellow most are default keybinds of hyprland
      "SUPER, C, killactive, "
      "SUPER, M, exit, "
      "SUPER, V, togglefloating, "
      "SUPER, P, pseudo, "
      "SUPER, J, togglesplit, "

      # move focus
      "SUPER, left, movefocus, l"
      "SUPER, right, movefocus, r"
      "SUPER, up, movefocus, u"
      "SUPER, down, movefocus, d"

      # switch workspace
      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER, 0, workspace, 10"

      # move active window to a workspace
      "SUPER SHIFT, 1, movetoworkspace, 1"
      "SUPER SHIFT, 2, movetoworkspace, 2"
      "SUPER SHIFT, 3, movetoworkspace, 3"
      "SUPER SHIFT, 4, movetoworkspace, 4"
      "SUPER SHIFT, 5, movetoworkspace, 5"
      "SUPER SHIFT, 6, movetoworkspace, 6"
      "SUPER SHIFT, 7, movetoworkspace, 7"
      "SUPER SHIFT, 8, movetoworkspace, 8"
      "SUPER SHIFT, 9, movetoworkspace, 9"
      "SUPER SHIFT, 0, movetoworkspace, 10"

      # example special workspace, i dont use, so, i just disable
      #"SUPER, S, togglespecialworkspace, magic"
      #"SUPER SHIFT, S, movetoworkspace, special:magic"

      # scroll through existing workspaces
      "SUPER, mouse_down, workspace, e+1"
      "SUPER, mouse_up, workspace, e-1"
      ];

      bindm = [
      # move/resize windows
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
      ];

      bindel = [
      # laptop multimedia keys
      ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume 15"
      ",XF86AudioLowerVolume, exec, swayosd-client --output-volume -15"
      ",XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
      ",XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
      ",XF86MonBrightnessUp, exec, swayosd-client --brightness +10"
      ",XF86MonBrightnessDown, exec, swayosd-client --brightness -10"

      # requires playerctl
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ];

      bindrl = [
      "CAPS, CAPS_LOCK, exec, swayosd-client --caps-lock-led input1::capslock"
      ];

  };
}
