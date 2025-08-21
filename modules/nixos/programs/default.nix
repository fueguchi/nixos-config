{
  programs = {
    nix-ld.enable = true;
    dconf.enable = true;
  };
  environment.systemPackages = with pkgs; [
    xdg-user-dirs 
    xdg-user-dirs-gtk
  ];
}
