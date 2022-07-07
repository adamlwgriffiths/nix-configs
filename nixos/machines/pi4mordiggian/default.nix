{ config, pkgs, lib, ... }:

let secrets = import ../../../secrets/pi4.nix;
in {
  imports =[
    "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/raspberry-pi/4"
    ./networking.nix
    ../../hardware/pi4.nix
    ../../profiles/timezone-melbourne.nix
    ../../profiles/keyboard-us.nix
    ../../profiles/ssh-server.nix
    ../../profiles/nextcloud.nix
  ];

  networking.hostName ="mordiggian";

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

    #users.nextcloud = {
    #  isNormalUser = false;
    #  extraGroups = [ "audio" ]
    #    ++ lib.optional config.networking.networkmanager.enable "networkmanager";
    #};
  };

  environment.systemPackages = with pkgs; [
  ];

  system.stateVersion = "22.05";
}
