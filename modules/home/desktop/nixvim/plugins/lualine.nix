{
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
    };
    extraConfigLua = ''
      local lualine = require('lualine')
      lualine.setup {
        options = {
          theme = 'pywal16-nvim',
        },
      }
    '';
  };
}
