{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      package = pkgs.vimPlugins.nvim-lspconfig;
    };

    cmp = {
      enable = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "buffer"; }
        ];
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
