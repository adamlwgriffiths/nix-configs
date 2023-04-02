{ config, pkgs, ... }:

let
    secrets = import ../../../secrets/htpc.nix;
in {
    _module.args.wg-peer = secrets.wg-peer;

    imports = [
        ../../hardware/optiplex-7060/default.nix
        ../../profiles/htpc/default.nix
    ];

    networking.hostName = "htpc";

    system.stateVersion = "22.11";
}
