{ 
  pkgs, 
  ... 
}: {
  home.packages = with pkgs; [
    protonvpn-gui
    protonmail-bridge
  ];
}