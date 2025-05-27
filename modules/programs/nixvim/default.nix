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
      pywal-nvim
      yuck-vim
      lualine-nvim
      nvim-autopairs
    ];
    colorscheme = "pywal";
  };
}
