{
    network.description = "htpc";
    network.enableRollback = true;

    network.storage.legacy = {
        databasefile = "~/.nixops/htpc.nixops";
    };
    "htpc-home" = { config, pkgs, ... }: {
        deployment.targetHost = "192.168.0.130";
        imports = [
            ../../nixos/machines/htpc-home/default.nix
        ];
    };
    "htpc-vm" = { config, pkgs, ... }: {
        deployment.targetHost = "192.168.0.69";
        #deployment.targetHost = "10.0.2.2";
        imports = [
            ../../nixos/machines/htpc-vm/default.nix
        ];
    };
    "htpc-griffiths" = { config, pkgs, ... }: {
        deployment.targetHost = "10.0.2.2";
        imports = [
            ../../nixos/machines/htpc-griffiths/default.nix
        ];
    };
    "htpc-valente" = { config, pkgs, ... }: {
        deployment.targetHost = "10.0.2.3";
        imports = [
            ../../nixos/machines/htpc-valente/default.nix
        ];
    };
}
