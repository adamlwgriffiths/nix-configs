# default uses sqlite
# postgres alternative setup: https://github.com/TheTesla/vagrant-nixos-nextcloud/blob/master/adminpassfile

{ pkgs, ... }:

{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud24;
    hostName = "rattenheit.synology.me";
    autoUpdateApps.enable = true;

    config = {
      adminpassFile = "/etc/nextcloud/adminpassfile";
    };
  };

  networking.firewall.allowedTCPPorts = [
    80 # http
    #443 # ssh
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
}
