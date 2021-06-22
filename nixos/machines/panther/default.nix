# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./peripherals.nix
    ../../profiles/default.nix
    ../../profiles/audio.nix
    #../../profiles/boot-splash.nix
    ../../profiles/desktop.nix
    ../../profiles/environment.nix
    ../../profiles/home-manager.nix
    ../../profiles/nixops.nix
    ../../profiles/power.nix
    ../../profiles/virtualisation.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.efiSupport = true;

  networking.hostName = "panther";

  # Select internationalisation properties.
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
  i18n = {
    defaultLocale = "en_AU.UTF-8";
  };

  services.openssh.enable = true;
  services.printing.enable = true;

  users.users.adam = {
    isNormalUser = true;
    description = "Adam Griffiths";
    extraGroups = [ "wheel" "video" "audio" "disk" "networkmanager" "libvirtd" "docker" ];
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
}

