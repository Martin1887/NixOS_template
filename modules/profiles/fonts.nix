{ pkgs, ... }:

let
  fonts = with pkgs; [
    nerd-fonts.cousine
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.roboto-mono
    nerd-fonts.sauce-code-pro
    carlito
    dejavu_fonts
    fira
    fira-code
    fira-mono
    inconsolata
    inter
    libertine
    lmodern
    noto-fonts
    noto-fonts-color-emoji
    roboto
    roboto-mono
    source-code-pro
    source-sans-pro
    source-serif-pro
    twitter-color-emoji
  ];
in {
  fonts = {
    fontDir.enable = true;
    fontconfig.enable = true;
    enableGhostscriptFonts = true;

    fontconfig.localConf = # xml
      ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
        <fontconfig>
          <alias binding="weak">
            <family>monospace</family>
            <prefer>
              <family>emoji</family>
            </prefer>
          </alias>
          <alias binding="weak">
            <family>sans-serif</family>
            <prefer>
              <family>emoji</family>
            </prefer>
          </alias>
          <alias binding="weak">
            <family>serif</family>
            <prefer>
              <family>emoji</family>
            </prefer>
          </alias>
        </fontconfig>
      '';
    packages = fonts;
  };
}
