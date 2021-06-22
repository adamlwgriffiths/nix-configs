{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      nix-index
      nixops
      sshfs
    ];
  };
}
