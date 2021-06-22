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
    (import ../overlays/obs-studio.nix)
  ];

  home.packages = with pkgs; [
    bitwarden
    bitwarden-cli
    brasero
    dropbox

    inkscape
    mumble
    pinta
    virt-manager
    xclip

    chromium

    obs-studio
  ] ++ (with unstable; [
    #obs-studio
  ]);
}
