{
  programs.nixvim.plugins = {
    web-devicons.enable = true;
    nvim-tree = {
      enable = true;
      disableNetrw = true;
    };
  };
  programs.nixvim.extraConfigLua = ''
    require("nvim-tree").setup({
      renderer = {
        indent_markers = { enable = true, },
        icons = {
          show = { folder_arrow = true, },
        },
      },
      })
  '';
}
