{ pkgs, ... }:

{
  home.packages = with pkgs; [
  # tools
  bind
  cmake
  conda
  docker-compose
  gnumake
  kicad
  niv
  nix-index
  python38Full
  sshfs

  # editors
  atom
  emacs
  ];
}
