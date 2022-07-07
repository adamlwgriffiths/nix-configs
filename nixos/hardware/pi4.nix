# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/raspberry-pi/4"
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.kernelPackages = pkgs.linuxPackages_rpi4;
  boot.tmpOnTmpfs = true;
  boot.initrd.availableKernelModules = [
    # Standard SCSI stuff.
    "sd_mod"
    "sr_mod"

    # SD cards and internal MMC drives.
    "mmc_block"

    # Support USB keyboards.
    "usbhid"
    "usb_storage"
    "hid_generic"
    "hid_lenovo"
    "hid_apple"
    "hid_roccat"
    "hid_logitech_hidpp"
    "hid_logitech_dj"
    "hid_microsoft"

    "xhci_pci"
  ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];

    # ttyAMA0 is the serial console broken out to the GPIO
  boot.kernelParams = [
    "8250.nr_uarts=1"
    "console=ttyAMA0,115200"
    "console=tty1"
    # Some gui programs need this
    #"cma=128M"
    "cma=256M"
  ];
  # defined in https://github.com/NixOS/nixos-hardware/blob/master/raspberry-pi/4
  #boot.loader.grub.enable = false;
  #boot.loader.generic-extlinux-compatible.enable = true;
  #hardware.enableRedistributableFirmware = true;

  #boot.loader.raspberryPi.enable = true;
  #boot.loader.raspberryPi.version = 4;
  boot.loader.raspberryPi.firmwareConfig = ''
    dtparam=audio=on
  '';

  # gpu support
  hardware.raspberry-pi."4".fkms-3d.enable = true;

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
    options = [ "noatime" ];
  };

  swapDevices = [];

  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";


  # audio
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true;

  # nixops deployment
  nix.trustedUsers = [ "root" "nixos" "@wheel" ];
  security.sudo.wheelNeedsPassword = false;

  nix = {
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    # Free up to 1GiB whenever there is less than 100MiB left.
    extraOptions = ''
      min-free = ${toString (100 * 1024 * 1024)}
      max-free = ${toString (1024 * 1024 * 1024)}
    '';
  };

  nixpkgs.config.allowUnfree = true;

}