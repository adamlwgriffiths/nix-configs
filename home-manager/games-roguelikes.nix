{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #adom
    #angband
    #arx-libertatis
    #brogue
    cataclysm-dda
    #crawl
    crawlTiles
    #dwarf-fortress
    #(dwarf-fortress-packages.dwarf-fortress-full.override {
    #  theme = "phoebus";
    #})
    #ivan
    #nethack
    #rogue
    #tome2
    #unnethack
    #zangband
  ];
}
