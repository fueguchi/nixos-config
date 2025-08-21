{
  imports = [
    ./config
    ./config/keybind.nix
    ./plugins
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorscheme = "pywal16";
  };
}
