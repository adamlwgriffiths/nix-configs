{ config, pkgs, ... }:

let
  vfio_device_ids = [
    "10de:1b80" # Nvidia GeForce GTX 1080
    "10de:10f0" # Nvidia GP104 Audio Controller
  ];
in {
  boot = {
    kernelParams = [ "intel_iommu=on" "iommu=pt" "iommu=1" ];
    kernelModules = [ "kvm-intel" ];

    extraModprobeConfig = ''
      options vfio-pci ids=${builtins.concatStringsSep "," vfio_device_ids}
      options vfio-pci disable_vga=1
    '';

    initrd.availableKernelModules = [ "vfio" "vfio_iommu_type1" "vfio_pci" "vfio_virqfd" ];
  };
}
