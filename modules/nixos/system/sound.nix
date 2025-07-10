{ pkgs, inputs, ... }:
{
  imports = [ inputs.nix-gaming.nixosModules.pipewireLowLatency ];
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    lowLatency = {
      enable = true;
      quantum = 64;
      rate = 48000;
    };
  };
  programs.noisetorch.enable = true;
  programs.noisetorch.package = pkgs.noisetorch;
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];
}
