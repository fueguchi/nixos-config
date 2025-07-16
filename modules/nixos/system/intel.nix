{ config, lib, pkgs, ... }:
{
  options = {
    intel.enable = lib.mkEnableOption "enable intel drivers module";
  };
  config = lib.mkIf config.intel.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      package = pkgs.mesa;
      package32 = pkgs.pkgsi686Linux.mesa;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-compute-runtime
        vpl-gpu-rt
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-media-driver
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
