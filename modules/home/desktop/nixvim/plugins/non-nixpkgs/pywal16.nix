{ config, pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "pywal16-nvim";
      version = "2025-06-06";
      src = pkgs.fetchFromGitHub {
        owner = "fueguchi";
        repo = "pywal16.nvim";
        rev = "47d0419a7532794c59cf1a9362c0a96a038d50ae";
        hash = "sha256-2344kZJCyOpzg8sNGsL2xXJUNdZywxIegv5mTZgQWrM=";
      };
     })
    ];
    extraConfigLua = ''
      local pywal16_core = require('pywal16.core')
      local colors = pywal16_core.get_colors()
    '';
  };
}
