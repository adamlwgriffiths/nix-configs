# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nixpkgs = {
    overlays = [
    ];
  };

  imports = [
    # core
    ./networking.nix
    ../../profiles/nix-unfree.nix
    ../../profiles/home-manager.nix
    # hardware
    ./hardware-configuration.nix
    <nixos-hardware/common/cpu/intel/cpu-only.nix>
    <nixos-hardware/common/pc/ssd>
    ../../profiles/audio.nix
    ../../profiles/hardware-nvidia.nix
    ../../profiles/device-corsair-kb.nix
    ../../profiles/keyboard-us.nix
    ../../profiles/timezone-melbourne.nix
    # system
    ../../profiles/boot-splash.nix
    ../../profiles/desktop-gnome.nix
    ../../profiles/desktop-x11.nix
    ../../profiles/nixops.nix
    ../../profiles/nixops-raspberrypi.nix
    ../../profiles/power.nix
    ../../profiles/printing.nix
    ../../profiles/shell.nix
    ../../profiles/ssh-server.nix
    ../../profiles/virtualisation.nix
    # software
    ../../profiles/application-steam.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.efiSupport = true;
  boot.cleanTmpDir = true;

  networking.hostName = "panther";

  users.users.adam = {
    isNormalUser = true;
    description = "Adam Griffiths";
    extraGroups = [ "wheel" "video" "audio" "disk" "networkmanager" "libvirtd" "docker" ];
    # direnv / conda don't work, not ready for prime time
    #shell = pkgs.nushell;
    shell = pkgs.bash;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}
