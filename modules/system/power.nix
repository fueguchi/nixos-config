{ config, lib, ... }:
{
  options = {
    laptop.enable = lib.mkEnableOption "enable laptop module";
  };
  config = lib.mkIf config.laptop.enable {
    powerManagement.enable = true;
    services.power-profiles-daemon.enable = false;
    services.tlp = {
      enable = true;
        settings = {
          CPU_SCALING_GOVERNOR_ON_AC = "performance";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

          CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
          CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

          CPU_MIN_PERF_ON_AC = 20;
          CPU_MAX_PERF_ON_AC = 100;
          CPU_MIN_PERF_ON_BAT = 0;
          CPU_MAX_PERF_ON_BAT = 20;

          INTEL_GPU_MIN_FREQ_ON_AC = 400;
          INTEL_GPU_MIN_FREQ_ON_BAT = 400;
        };
    };
  };
}