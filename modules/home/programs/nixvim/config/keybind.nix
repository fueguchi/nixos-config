{
programs.nixvim.globals.mapleader = " ";
programs.nixvim.keymaps = [
    {
      mode = "n";       
      key = "<leader>q";
      action = ":NvimTreeToggle<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle NvimTree";
      };
    }
    {
      mode = "n";
      key = "<leader>w";
      action = ":NvimTreeFocus<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Focus NvimTree";
      };
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "<C-w>p";
      options = {
        noremap = true;
        silent = true;
        desc = "Focus previous window";
      };
    }
    {
      mode = "n";
      key = "<C-s>";
      action = "<ESC>:w<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Bind to save files without exit";
      };
    }
    {
      mode = "n";
      key = "<leader>t";
      action = "<ESC>:Telescope find_files<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }
  ];
}