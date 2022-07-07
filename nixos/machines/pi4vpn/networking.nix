# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    # required for networkmanager.profiles {} below
    (import (builtins.fetchTarball https://github.com/jmackie/nixos-networkmanager-profiles/archive/master.tar.gz))
  ];

  environment = {
    systemPackages = with pkgs; [
    ];
  };

  networking.interfaces.eth0.useDHCP = true;
  networking.interfaces.wlan0.useDHCP = true;
}
