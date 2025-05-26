{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    configPath = "$HOME/.dotfiles/home/desktop/programs/rofi/themes/hyprstellar/config.rasi";
  };
}
