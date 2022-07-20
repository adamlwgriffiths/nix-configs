{ config, lib, pkgs, ... }:

{
  imports = [
    # required for networkmanager.profiles {} below
    (import (builtins.fetchTarball https://github.com/jmackie/nixos-networkmanager-profiles/archive/master.tar.gz))
  ];

  environment = {
    systemPackages = with pkgs; [
      bridge-utils
      networkmanager
    ];
  };

  networking.firewall = {
    # annoying af not being able to control this
    # without making a new system image
    enable = false;
    allowPing = true;
    allowedTCPPorts = [
    ];
    allowedUDPPorts = [
    ];
    # permit DHCP from VMs
    checkReversePath = false;
  };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

  networking.networkmanager = {
    enable = true;
    profiles = {
      # values derrived from /etc/NetworkManager/system-connections/*
      # generated by nmtui
      "home-wired" = {
        connection = {
          id = "home-wired";
          uuid = "cc716b00-ab4d-3266-8ccf-99b18c6f3fc9";
          type = "ethernet";
          autoconnect-priority = -999;
          interface-name = "enp0s31f6";
          permissions = "";
        };
        ipv4.method = "auto";
        ipv6.addr-gen-mode = "stable-privacy";
        ipv6.method = "auto";
      };
    };
  };
}
