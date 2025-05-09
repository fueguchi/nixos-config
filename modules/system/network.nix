{ pkgs, ... }:
{
  networking = {
    hostName = "wired";
    networkmanager.enable = true;
    #nameservers = [ ]; # DNS change if needed
  };
  
  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
