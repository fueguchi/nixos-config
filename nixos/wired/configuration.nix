{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/nixos
    ../bootloader/wired
    ./hardware-configuration.nix
    ./.
  ];

  desktop = {
    hyprland.enable = true;
  };

  gaming = {
    minecraft.enable = true;
    steam.enable = false;
    osu.enable = true;
    heroic.enable = true;
    r2mod.enable = false;
    gamemode.enable = true;
  };

  virt = {
    docker.enable = true;
    manager.enable = false;
  };

  drivers = {
    intel.enable = true;
  };
  
  keyring.enable = true;

  users.users.erik = {
    isNormalUser = true;
    description = "erik";
    extraGroups = [
      "networkmanager"
      "wheel"
      "gamemode"
      "libvirtd"
      "video"
      "input"
      "docker"
    ];
  };

  system.stateVersion = "25.05";
}
