{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {name = "path";}
          {name = "buffer";} 
        ];
        snippet = {
          expand = "luasnip";
        };
        mappin = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-n>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })";
          "<C-p>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })";
          "<Tab>" = "cmp.mapping.luasnip_expand_or_jump()";
          "<S-Tab>" = "cmp.mapping.luasnip_jump_prev()";
        };
      };
    };
  ts-autotag.enable = true;
  };
}