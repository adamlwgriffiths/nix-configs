{ config, pkgs, lib, ... }:

let secrets = import ../../../secrets/pi4.nix;
in {
  imports =[
    "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/raspberry-pi/4"
    ../../hardware/pi4.nix
  ];

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  # audio
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  # let packages know to use pulse audio
  nixpkgs.config.pulseaudio = true;

  networking = {
    hostName ="sho-gath";
    networkmanager = {
      enable = true;
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
    };
  };

  time.timeZone = "Australia/Melbourne";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";
  services.xserver.layout = "us";

  users = {
    defaultUserShell = pkgs.bash;
    mutableUsers = false;

    users.root = {
      hashedPassword = secrets.users.root.hashedPassword;
      openssh.authorizedKeys.keys = secrets.users.root.openssh.authorizedKeys;
    };

    users.nixos = {
      isNormalUser = true;
      hashedPassword = secrets.users.nixos.hashedPassword;
      openssh.authorizedKeys.keys = secrets.users.nixos.openssh.authorizedKeys;
      extraGroups = [ "audio" "wheel" ]
        ++ lib.optional config.networking.networkmanager.enable "networkmanager";
    };
  };

  nix.trustedUsers = [ "nixos" ];
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

  nixpkgs.config = {
    allowUnfree = true;
  };

  services.openssh = {
    enable = true;
    #permitRootLogin = "prohibit-password";
    permitRootLogin = "no";
  };

  services.xserver = {
    enable = true;
    desktopManager.xfce.enable = true;
    displayManager.lightdm.enable = true;
    displayManager.defaultSession = "xfce";
  };

  environment.systemPackages = with pkgs; [
    plex-media-player
  ];

  system.stateVersion = "21.05";
}
