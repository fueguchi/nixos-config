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

  # manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull ];
      };
    };
  };
  services.spice-vdagentd.enable = true;
}