{
  imports = [
    ./non-nixpkgs
    ./neocord.nix
    ./lualine.nix
    ./colorizer.nix
    ./lsp.nix
    ./nvim-tree.nix
    ./cmp.nix
    ./telescope.nix
  ];
  programs.nixvim = {
    extraConfigLua = ''
      local pywal16 = require('pywal16')
      pywal16.setup()
      require('lualine').setup()
      require('nvim-autopairs').setup() 
    '';
  };
}
