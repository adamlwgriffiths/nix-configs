{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnome.aisleriot
    gnome.gnome-books
    gnome.gnome-chess
    gnome.gnome-calendar
    gnome.gnome-mines
    gnome.gnome-nettool
    gnome.gnome-sudoku
    gnome.gnome-tweaks
    pkgs.networkmanagerapplet
    gnome.polari

    # browser
    epiphany
  ];
}
