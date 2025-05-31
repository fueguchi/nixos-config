{
  programs.nixvim = {
    extraConfigLua = ''
      local pywal = require('pywal')

      pywal.setup()
    '';
    opts = {
      number = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      smartindent = true;
    };
  };
}
