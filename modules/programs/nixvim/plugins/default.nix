{
  imports = [
    ./neocord.nix
    ./lualine.nix
  ];
  programs.nixvim = {
    extraConfigLua = ''
      local pywal = require('pywal')
      pywal.setup()
      require('lualine').setup()
      require('nvim-autopairs').setup()
    '';
  };
}
