{ pkgs, ... }:

let
  unstable = import <unstable> {};
in {
  #nixpkgs.config.packageOverrides = pkgs: {
  #  ffmpeg-full = unstable.ffmpeg-full.override {
  #    #lame=true;
  #    srt=true;
  #    #x264=true;
  #    #x265=true;
  #  };
  #};
  nixpkgs.overlays = [
    (import ./overlays/obs-studio.nix)
  ];

  home.packages = with pkgs; [
    # apps
    bitwarden
    bitwarden-cli
    brasero
    dropbox

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

    inkscape
    mumble
    pinta
    virt-manager
    xclip

    # browser
    epiphany
    chromium

    obs-studio
  ] ++ (with unstable; [
    #obs-studio
  ]);
}
