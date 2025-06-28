{ pkgs, ... }:
{
  imports = [
    ./plugins
    ./keybinds
    ./config
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    extraPlugins = with pkgs.vimPlugins; [
      nvim-autopairs
      nvim-colorizer-lua
      transparent-nvim
      lualine-nvim
      vim-suda
      yuck-vim
      neocord
    ];
    colorscheme = "pywal16";
  };
}
