{
  programs.nixvim.plugins = {
    web-devicons.enable = true;
    nvim-tree = {
      enable = true;
      settings = {
        filters.dotfiles = true;
        disable_netrw = true;
        renderer.indent_markers.enable = true; 
      };
    };
  };
}
