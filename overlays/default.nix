{
  inputs,
  ...
}: final: prev:
let
  additions = import ../pkgs { pkgs = final; };
in
  additions // {
    vimPlugins = prev.vimPlugins // additions.nvim-plugins;
    
    sf-mono-liga-bin = prev.stdenvNoCC.mkDerivation rec {
      pname = "sf-mono-liga-bin";
      version = "dev";
      src = inputs.sf-mono-liga-src;
      dontConfigure = true;
      installPhase = ''
        mkdir -p $out/share/fonts/opentype
        cp -R $src/*.otf $out/share/fonts/opentype/
      '';
    };

    obs-studio = prev.obs-studio.override {
      ffmpeg = final.ffmpeg-full;
    };

    discord = prev.discord.override {
      withOpenASAR = true;
      withVencord = true;
    };
}
