{
  programs.nixvim.extraConfigLua = ''
    vim.lsp.config('ccls', {
      settings = {
        ['ccls'] = {},
      },
    })
  '';
}
