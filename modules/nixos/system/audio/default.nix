{
  pkgs,
  lib,
  config,
  ...
}: {
  security.rtkit.enable = true; 
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    lowLatency = {
      enable = config.gaming.osu.enable;
      quantum = lib.mkIf config.gaming.osu.enable 64;
      rate = lib.mkIf config.gaming.osu.enable 48000;
    };
    
    extraConfig.pipewire."custom-rate" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.allowed-rates" = "[ 48000 ]";
      };
    };

    wireplumber.enable = true;
  };
  
  programs.noisetorch.enable = true;
  programs.noisetorch.package = pkgs.noisetorch;

  environment.systemPackages = with pkgs; [
    pavucontrol
    pamixer
    alsa-utils
  ];
}
