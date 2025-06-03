{ config, lib, pkgs, ... }:
{
  options = {
    intel.enable = lib.mkEnableOption "enable intel drivers module";
  };
  config = lib.mkIf config.intel.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-media-sdk
        intel-compute-runtime
        intel-vaapi-driver
        libva
        intel-ocl
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [  intel-vaapi-driver ];
    };
    environment.systemPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
      intel-gmmlib
    ];
    environment.variables = {
      LIBVA_DRIVER_NAME = "iHD";
      XDG_SESSION_TYPE = "wayland";
    };
  };
}
