{ pkgs, ... }:

let
  wol-maus = pkgs.writeShellScriptBin "wol-maus" ''
    wol 00:11:32:C8:45:F1
  '';
in {
  home.packages = with pkgs; [
    # in systems packages
    #wol
    wol-maus
  ];
}
