# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # core
      ./networking.nix
      ../../profiles/nix-unfree.nix
      ../../profiles/home-manager.nix
      # hardware
      ./hardware-configuration.nix
      <nixos-hardware/asus/zephyrus/ga503>
      ../../profiles/audio.nix
      ../../profiles/keyboard-us.nix
      ../../profiles/power.nix
      ../../profiles/timezone-melbourne.nix
      # services
      ../../profiles/ssh-server.nix
      # software
      ../../profiles/desktop-gnome.nix
      ../../profiles/desktop-x11.nix
      ../../profiles/shell.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.efiSupport = true;
  boot.cleanTmpDir = true;

  # use latest linux kernel to get support for MediaTek wireless card
  # https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=d60ea31cb4343623a9d499cfbd05a577e58d9e79
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "dygra";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  #  useXkbConfig = true;
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.adam = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "disk" "networkmanager" ];
    shell = pkgs.bash;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
