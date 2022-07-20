{ pkgs, ... }:

{
  imports = [
    ../../profiles/applications-chat.nix
    ../../profiles/applications-gnome.nix
    ../../profiles/applications-steam.nix
    ../../profiles/applications-synology.nix
    ../../profiles/applications.nix
    ../../profiles/desktop-gnome.nix
    ../../profiles/development.nix
    ../../profiles/environment.nix
    ../../profiles/fonts.nix
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
}
