{ config, pkgs, ... }:

let
    wg-client-ip = "10.0.2.3";
    wg-private-key-file = ../../../secrets/htpc-valente/wg-privatekey;
    secrets = import ../../../secrets/htpc.nix;
in {
    _module.args.wg-client-ip = wg-client-ip;
    _module.args.wg-private-key-file = wg-private-key-file;
    _module.args.wg-peer = secrets.wg-peer;

    imports = [
        ../../hardware/optiplex-7060/default.nix
        ../../profiles/htpc/default.nix
        ../../profiles/wireguard/htpc.nix
    ];

    networking.hostName = "htpc-valente";

    system.stateVersion = "22.11";
}
