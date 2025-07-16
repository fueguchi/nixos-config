{ config, lib, pkgs, ... }:
{
  options.social = {
    element.enable = lib.mkEnableOption "enable element";
    telegram.enable = lib.mkEnableOption "enable telegram";
    discord.enable = lib.mkEnableOption "enable discord";
  };
  config = {
    programs.element-desktop = lib.mkIf config.social.element.enable {
      enable = true;
    };

    xdg.desktopEntries."element-desktop" = lib.mkIf config.social.element.enable {
      name = "Element";
      exec = "${pkgs.element-desktop}/bin/element-desktop --password-store=gnome-libsecret";
      icon = "element-desktop";
      terminal = false;
      type = "Application";
    };

    home.packages = with pkgs; (lib.optionals config.social.discord.enable [
      (discord.override { withVencord = true; })
    ]) ++ (lib.optional config.social.telegram.enable 
      telegram-desktop
    );
  };
}
