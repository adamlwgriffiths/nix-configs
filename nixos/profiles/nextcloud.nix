# default uses sqlite
# postgres alternative setup: https://github.com/TheTesla/vagrant-nixos-nextcloud/blob/master/adminpassfile

{ pkgs, ... }:

let
  hostname = "rattenheit.synology.me";
  trusted_domains = [
    "192.168.0.*"
  ];
in {
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud24;
    hostName = hostname;
    autoUpdateApps.enable = true;
    https = true;

    config = {
      adminpassFile = "/etc/nextcloud/adminpassfile";
      extraTrustedDomains = trusted_domains;
    };
  };

  services.nginx.virtualHosts.${hostname} = {
    forceSSL = true;
    sslCertificate = "/etc/nextcloud/RSA-cert.pem";
  	sslCertificateKey = "/etc/nextcloud/RSA-privkey.pem";
  };

  networking.firewall.allowedTCPPorts = [
    80 # http
    443 # ssh
  ];

  # must be a nix config file called /secrets/nextcloud.adminpassfile
  # whos conents is ONLY the admin password
  # TODO: pass this in as a variable instead
  environment.etc."nextcloud/adminpassfile" = {
    source = ../../secrets/nextcloud.adminpassfile;
    user = "nextcloud";
    group = "nextcloud";
    mode = "0440";
  };
  environment.etc."nextcloud/RSA-cert.pem" = {
    source = ../../secrets/maus_ssl_cert/RSA-cert.pem;
    user = "nginx";
    group = "nginx";
    mode = "0440";
  };
  environment.etc."nextcloud/RSA-privkey.pem" = {
    source = ../../secrets/maus_ssl_cert/RSA-privkey.pem;
    user = "nginx";
    group = "nginx";
    mode = "0440";
  };
}
