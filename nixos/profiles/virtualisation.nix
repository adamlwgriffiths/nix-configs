{ config, pkgs, ... }:

let
  eth-device = "enp0s31f6";
in {
  imports = [
    ./virtualisation-gpu-passthrough.nix
  ];

  # failing this, set
  # $ export NIXPKGS_ALLOW_INSECURE=1
  nixpkgs.config.permittedInsecurePackages = [
    "libvirt-5.9.0"
  ];

  boot = {
    # virtualisation ip4 nat support
    kernel.sysctl = {
      "net.ipv4.ip_forward" = 1;
    };
  };

  virtualisation = {
    docker.enable = true;

    spiceUSBRedirection.enable = true;

    libvirtd = {
      enable = true;

      onBoot = "ignore";
      onShutdown = "shutdown";

      qemu = {
        ovmf.enable = true;
        runAsRoot = false;
      };
    };
  };

  networking.firewall.checkReversePath = false;
}
