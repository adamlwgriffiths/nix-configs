{ pkgs, ... }:

{
  imports = [
    ../../profiles/applications-chat.nix
    ../../profiles/applications-steam.nix
    ../../profiles/applications-gnome.nix
    ../../profiles/applications.nix
    ../../profiles/desktop-gnome.nix
    ../../profiles/development.nix
    ../../profiles/environment.nix
    ../../profiles/games-roguelikes.nix
    ../../profiles/games.nix
    ../../profiles/network.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs.home-manager = {
    enable = true;
  };
}