{ pkgs, ... }:

{
  imports = [
    ../../profiles/applications-3d-graphics.nix
    ../../profiles/applications-audio-editing.nix
    ../../profiles/applications-chat.nix
    ../../profiles/applications-electronics.nix
    ../../profiles/applications-gnome.nix
    ../../profiles/applications-office.nix
    ../../profiles/applications-os-images.nix
    ../../profiles/applications-steam.nix
    ../../profiles/applications-synology.nix
    ../../profiles/applications-video-editing.nix
    ../../profiles/applications.nix
    ../../profiles/desktop-gnome.nix
    ../../profiles/development.nix
    ../../profiles/environment.nix
    ../../profiles/fonts.nix
    ../../profiles/games-roguelikes.nix
    ../../profiles/games.nix
    ../../profiles/network.nix
  ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (import ../../overlays/paperwm.nix)
    (import ../../overlays/obs-studio.nix)
  ];

  programs.home-manager = {
    enable = true;
  };

  home.username = "adam";
  home.homeDirectory = "/home/adam";
  home.stateVersion = "22.11";
}
