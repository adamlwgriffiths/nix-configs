{ pkgs, ... }:

{
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  #nixpkgs.localSystem = { system = "x86_64-linux"; };
  #nixpkgs.crossSystem = { system = "aarch64-linux"; };
}
