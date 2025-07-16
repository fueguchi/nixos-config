{ pkgs, ... }:
{
  services.gnome-keyring = {
    enable = true;
    components = [ "pkcs11" "ssh" "secrets" ];
  };

  home.packages = [ pkgs.gcr ];
}
