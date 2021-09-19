# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nixpkgs = {
    overlays = [
      (self: super: {
        linuxPackages_latest = super.linuxPackages_latest.extend (self: super: {
          nvidia_x11 = super.nvidia_x11.overrideAttrs (attrs: {
            patches = [
              (pkgs.fetchpatch {
                url = "https://raw.githubusercontent.com/Frogging-Family/nvidia-all/master/patches/kernel-5.14.patch";
                sha256 = "042zyspddka1acmli9l4h4cbzpfgq8a9lcdwjgwjr0npdgqk3j3f";
                stripLen = 2;
                extraPrefix = "kernel/";
              })
            ];
          });
        });
      })
    ];
  };

  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ../../profiles/application-steam.nix
    ../../profiles/audio.nix
    #../../profiles/boot-splash.nix
    ../../profiles/device-corsair-kb.nix
    ../../profiles/device-ios.nix
    ../../profiles/desktop-gnome.nix
    ../../profiles/desktop-x11.nix
    ../../profiles/environment.nix
    ../../profiles/hardware-nvidia.nix
    ../../profiles/home-manager.nix
    # breaks nvidia on 20.09
    ../../profiles/kernel-linux-latest.nix
    ../../profiles/keyboard-us.nix
    #../../profiles/nix-auto-upgrade.nix
    ../../profiles/nix-unfree.nix
    ../../profiles/nixops.nix
    ../../profiles/power.nix
    ../../profiles/printing.nix
    ../../profiles/ssh-server.nix
    ../../profiles/timezone-melbourne.nix
    ../../profiles/virtualisation.nix
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
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}
