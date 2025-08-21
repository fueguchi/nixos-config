{
  imports = [
    ./desktop/common
    ./desktop/hyprland

    ./gaming

    ./system/db
    ./system/services
    ./system/audio
    ./system/drivers
    ./system/environment
    ./system/keyring
    ./system/shell/fish.nix

    ./virtualisation/docker
    ./virtualisation/virt-manager
    ./nix.nix
  ];
}
