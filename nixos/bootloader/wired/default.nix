{
  boot = {
    initrd.kernelModules = [ 
      "i915"
    ];
    kernelParams = [
      "intel_iommu=on"
    ];
  };

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      useOSProber = true;
      efiSupport = true;
      devices = [ "nodev" ];
    };
  };
}
