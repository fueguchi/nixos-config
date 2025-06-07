{ pkgs, ... }:
{
  imports = [
    ./plugins
    ./keybinds
    ./config
  ];
  programs.nixvim = {
    enable = true;
    extraPlugins = with pkgs.vimPlugins; [
      transparent-nvim
      telescope-nvim
      neocord
      vim-suda
      yuck-vim
      lualine-nvim
      nvim-autopairs
      nvim-colorizer-lua
    ];
    colorscheme = "pywal16";
  };
}
