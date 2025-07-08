{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      package = pkgs.vimPlugins.nvim-lspconfig;
      servers = {
        clangd.enable = true;
        lua_ls.enable = true;
        nixd.enable = true;
      };
    };
  
    lspkind.enable = true;
    
    treesitter = {
      enable = true;
      settings = {
        ensureInstalled = [ "c" "cpp" ];
      };
    };
    clangd-extensions.enable = true;
  };
}
