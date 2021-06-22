{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      nix-index
      nixops
      sshfs
    ];
  };

  nixpkgs.overlays = [
    (import ../overlays/nixops.nix)
  ];
}
