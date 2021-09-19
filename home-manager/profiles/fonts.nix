{ pkgs, config, ... }:


{
  fonts.fontconfig.enable = true;
  #fonts.enableDefaultFonts = true;
  home.packages = with pkgs; [
    #noto-fonts
    #noto-fonts-cjk
    #noto-fonts-emoji
    #google-fonts
    #liberation_ttf
    #fira-code
    #fira-code-symbols
    #mplus-outline-fonts
    #dina-font
    #proggyfonts

    #go-font
    #tewi-font
    #hack-font
    #profont
    #gohufont
    #terminus_font_ttf
    #ultimate-oldschool-pc-font-pack
  ];
}
