{ pkgs, ... }:
{
  programs.nixvim = {
    extraConfigLua = ''
      local pywal = require('pywal')

      pywal.setup()
    '';
    opts = {
      termguicolors = true;
      number = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      smartindent = true;
    };
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy = {
        enable = true;
        package = pkgs.wl-clipboard;
      };
    };
  };
}
