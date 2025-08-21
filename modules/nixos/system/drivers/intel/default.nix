{ 
  config,
  lib, 
  pkgs, 
  ... 
}: {
  options.drivers.intel.enable = lib.mkEnableOption "enable intel drivers";
  config = lib.mkIf config.drivers.intel.enable {
    services.thermald.enable = lib.mkDefault true;
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      package = pkgs.mesa;
      package32 = pkgs.pkgsi686Linux.mesa;
      extraPackages = with pkgs; [
        intel-media-driver
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-media-driver
      ];
    };
    environment.variables.LIBVA_DRIVER_NAME = "iHD";
  };
}
