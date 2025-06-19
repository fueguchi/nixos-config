{ pkgs, ... }:
{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    audio.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };
  programs.noisetorch.enable = true;
  programs.noisetorch.package = pkgs.noisetorch;
}
