{ lib, ... }:
{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      include ~/.cache/wal/colors-kitty.conf
      background_opacity 0.7
      background_blur 1
    '';
    settings = {
      confirm_os_window_close = 0;
      font_family = "Maple Mono SC NF";
      window_margin_width = 18;
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
    };
  };
}
