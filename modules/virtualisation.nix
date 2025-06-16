{ pkgs, ... }:
{
  # enable dconf
  programs.dconf.enable = true;
  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    adwaita-icon-theme
  ];
  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };
  virtualisation.spiceUSBRedirection.enable = true;
  # manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        vhostUserPackages = [ pkgs.virtiofsd ];
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
  };
}
