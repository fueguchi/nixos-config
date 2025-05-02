{
  boot = {
    initrd.kernelModules = [ "i915" ];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
	useOSProber = true;
	efiSupport = true;
	devices = [ "nodev" ];
      };
    };
  };
}
