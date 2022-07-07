# Edit this configuration file to define what should be installed on  ];

# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

let secrets = import ../../../secrets/pi4.nix;
in {
  networking.usePredictableInterfaceNames = false;

  networking.useDHCP = lib.mkDefault true;
  networking.interfaces.eth0.useDHCP = lib.mkDefault true;
  networking.interfaces.wlan0.useDHCP = lib.mkDefault true;

  networking.wireless.enable = true;
  networking.wireless.userControlled.enable = true;
  networking.wireless.networks = {
    Mahakali = {
      pskRaw = secrets.networks.Mahakali.psk;
    };
  };

  networking.firewall.enable = true;
}
