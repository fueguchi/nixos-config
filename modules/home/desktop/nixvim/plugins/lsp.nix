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
        qmlls.enable = true;
      };
    };
    emmet = {
      enable = true;
      package = pkgs.vimPlugins.emmet-vim;
      autoLoad = true;
    };
    lspkind = {
      enable = true;
      package = pkgs.vimPlugins.lspkind-nvim;
    };

    treesitter = {
      enable = true;
      settings = {
        ensureInstalled = [ "c" "cpp" "javascript" "typescript" "nix" "html" "css" ];
      };
    };

    clangd-extensions.enable = true;
  };
}
