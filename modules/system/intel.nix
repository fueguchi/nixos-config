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
        intel-vaapi-driver
        intel-compute-runtime
        vaapiIntel
        libva
        intel-ocl
      ];
    };
    environment.systemPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
    ];
    environment.variables = {
      LIBVA_DRIVER_NAME = "iHD";
      XDG_SESSION_TYPE = "wayland";
    };
  };
}
