{ wg-client-ip, wg-private-key-file, wg-peer, ... }:

# NOTE: we use privateKeyFile to avoid it becoming world-readable via the configuration
# To make a privateKeyFile:
# wg genkey > private
# wg pubkey < private > public

# route all traffic over wg?
# https://discourse.nixos.org/t/route-all-traffic-through-wireguard-interface/1480/18

let
    wg-interface = "wg0";
    local-ip = "${wg-client-ip}/32";
    listen-port = 36671;
    peer-ips = [ "${wg-client-ip}/32" wg-peer.allowed-ips ];
    peer-keepalive = 30;
in {
    # copy the private key to the system
    environment.etc."wireguard/${wg-interface}/privatekey" = {
        source = wg-private-key-file;
        user = "root";
        group = "root";
        mode = "0440";
    };

    networking.firewall.allowPing = true;
    networking.firewall.allowedUDPPorts = [ listen-port ];

    networking.wireguard.enable = true;
    networking.wireguard.interfaces = {
        wg-interface = {
            ips = [ local-ip ];
            privateKeyFile = "/etc/wireguard/${wg-interface}/privatekey";
            listenPort = listen-port;

            peers = [{
                endpoint = wg-peer.endpoint;
                allowedIPs = peer-ips;
                publicKey = wg-peer.public-key;
                persistentKeepalive = peer-keepalive;
            }];
        };
    };
}
