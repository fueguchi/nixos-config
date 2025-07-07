{ pkgs, ... }:
{
  services.gnome-keyring = {
    components = [ "pkcs11" "ssh" "secrets" ];
  };
}
