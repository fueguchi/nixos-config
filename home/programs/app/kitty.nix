{ lib, ... }:
{
  programs.kitty = lib.mkForce {
    enable = true;
    extraConfig = ''
      include ~/.cache/wal/colors-kitty.conf
    '';
    settings = {
      confirm_os_window_close = 0;
      font_family = "Liga SFMono Nerd Font";
      background_blur = 1;
      background_opacity = "0.7";
      scrollback_indicator_opacity = 0;
      window_margin_width = 18;
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
    };
  };
}