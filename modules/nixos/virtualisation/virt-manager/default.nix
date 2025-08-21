{
  pkgs,
  config,
  lib,
  ...
}: {
  options.virt.manager.enable = lib.mkEnableOption "enable vm";

  config = lib.mkIf config.virt.manager.enable {
    programs.virt-manager.enable = true;

    environment.systemPackages = with pkgs; [
      virt-viewer
      spice
      spice-gtk
      spice-protocol
      adwaita-icon-theme
      hwloc
    ];

    virtualisation.spiceUSBRedirection.enable = true;

    virtualisation.libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          vhostUserPackages = [
            pkgs.virtiofsd
          ];
          ovmf.enable = true;
          ovmf.packages = [
            pkgs.OVMFFull.fd
          ];
          swtpm.enable = true;
        };
      };
    services = {
      qemuGuest.enable = true;
      spice-vdagentd.enable = true;
    };
  };
}