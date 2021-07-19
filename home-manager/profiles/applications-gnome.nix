{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnome3.aisleriot
    gnome3.gnome-books
    gnome3.gnome-chess
    gnome3.gnome-calendar
    gnome3.gnome-mines
    gnome3.gnome-nettool
    gnome3.gnome-sudoku
    gnome3.gnome-tweaks
    gnome3.networkmanagerapplet
    gnome3.polari

    # browser
    epiphany
  ];
}
