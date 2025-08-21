{
  config,
  lib,
  pkgs,
  ...
}: {
  options.keyring.enable = lib.mkEnableOption "enable gnome keyring";
  config = lib.mkIf config.keyring.enable {

    security.pam.services = {
      sddm.enableGnomeKeyring = true;
      sddm-password.enableGnomeKeyring = true;
      login.enableGnomeKeyring = true;
    };

    services.dbus.packages = [ pkgs.gnome-keyring pkgs.gcr ];
    services.xserver.updateDbusEnvironment = true;

    programs.seahorse.enable = true;
    
    environment.systemPackages = with pkgs; [
      libsecret
    ];
  };
}
