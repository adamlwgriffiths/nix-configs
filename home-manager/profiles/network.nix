{ pkgs, ... }:

let
  wol-maus = pkgs.writeShellScriptBin "wol-maus" ''
    wol 00:11:32:C8:45:F1
  '';
  wol-proxmox = pkgs.writeShellScriptBin "wol-proxmox" ''
    wol 48:0F:CF:56:A7:65
  '';
in {
  home.packages = with pkgs; [
    # in systems packages
    #wol
    wol-maus
    wol-proxmox
  ];
}
