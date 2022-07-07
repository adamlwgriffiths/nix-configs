{ pkgs, ... }:

#let
#  unstable = import <unstable> {};
#in {
{
  home.packages = with pkgs; [
    bitwarden
    bitwarden-cli
    brasero
    dropbox

    inkscape
    mumble
    pinta
    xclip

    # virtual machines
    virt-manager

    chromium

    obs-studio
#  ] ++ (with unstable; [
#    #obs-studio
#  ]);
  ];
}
