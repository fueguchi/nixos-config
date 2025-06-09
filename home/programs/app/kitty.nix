{ lib, ... }:
{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      include ~/.cache/wal/colors-kitty.conf
      background_opacity 0.5
      background_blur 1
    '';
    font = {
      name = "DepartureMono Nerd Font";
      size = 12;
    };
    settings = {
      update_check_interval = 0;
      confirm_os_window_close = 0;
      window_margin_width = 18;
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
    };
  };
}
