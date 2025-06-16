{ pkgs, ... }:
{
  services.zerotierone = {
    enable = true;
    package = pkgs.zerotierone;
    joinNetworks = [
      "8056c2e21c418b58"
    ];
    port = 9993;
  };
  networking.firewall = {
    enable = true;
    allowedUDPPorts = [
      9993
    ];
    allowedTCPPorts = [
      25565
    ];
  };
}
