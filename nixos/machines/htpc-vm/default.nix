{ config, pkgs, ... }:

let
    wg-client-ip = "10.0.2.2";
    wg-private-key-file = ../../../secrets/htpc-griffiths/wg-privatekey;
in {
    _module.args.wg-client-ip = wg-client-ip;
    _module.args.wg-private-key-file = wg-private-key-file;
    imports = [
        ../../hardware/htpc-vm/default.nix
        ../../profiles/htpc/default.nix
    ];

    networking.hostName = "htpc-vm";

    system.stateVersion = "22.11";
}
