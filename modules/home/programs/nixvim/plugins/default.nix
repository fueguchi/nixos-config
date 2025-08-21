{ 
  pkgs, 
  ... 
}: {
  imports = [
    ./nix/nvim-autopairs.nix
    ./nix/lsp.nix
    ./nix/cmp.nix
    ./nix/neocord.nix
    ./nix/pywal16.nix
    ./nix/colorizer.nix
    ./nix/lualine.nix
    ./nix/nvim-tree.nix
    ./nix/telescope.nix
  ];
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    yuck-vim
  ];

  home.packages = with pkgs; [
    ripgrep
    fzf
    universal-ctags 
    ccls
    nixd
    #typescript-language-server
  ];

  #home.file.".config/nvim/plugins/nvim-tree.lua".source = ./lua/nvim-tree.lua;
  home.file.".config/nvim/plugins/pywal16.lua".source = ./lua/pywal16.lua;
}
