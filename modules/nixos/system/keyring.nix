{ config, lib, pkgs, ... }:
{
  options.keyring.enable = lib.mkEnableOption "enable keyring module";
  config = lib.mkIf config.keyring.enable {
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.sddm.enableGnomeKeyring = true;
    programs.seahorse.enable = true;
    environment.systemPackages = with pkgs; [
      libsecret
    ];
  };
}
