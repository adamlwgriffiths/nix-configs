{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      #nix-index
      nixops
      # nixops 2 required for targetUser to work
      #nixops_unstable
      #sshfs
    ];
  };

  # required for nixops 1
  nixpkgs.config.permittedInsecurePackages = [
    "python2.7-pyjwt-1.7.1"
  ];


  #nixpkgs.overlays = [
  #  (import ../overlays/nixops.nix)
  #];
}
