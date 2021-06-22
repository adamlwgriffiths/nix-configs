{ pkgs, ... }:

{
  imports = [
    ./applications-chat.nix
    ./applications-steam.nix
    ./applications.nix
    ./desktop.nix
    ./development.nix
    ./environment.nix
    ./games-roguelikes.nix
    ./games.nix
    ./network.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs.home-manager = {
    enable = true;
  };
}
