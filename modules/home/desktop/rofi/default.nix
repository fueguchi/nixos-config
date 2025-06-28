{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    configPath = "$HOME/.dotfiles/home/desktop/programs/rofi/themes/theme-1/config.rasi";
  };
}
