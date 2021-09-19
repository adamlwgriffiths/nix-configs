{ pkgs, ... }:

let
  linuxPackages_patched = pkgs.linuxPackages_latest.extend (self: super: {
    nvidia_x11 = super.nvidia_x11.overrideAttrs (oA: {
      patches = [
        (pkgs.fetchpatch {
          url = "https://raw.githubusercontent.com/Frogging-Family/nvidia-all/master/patches/kernel-5.14.patch";
          sha256 = "042zyspddka1acmli9l4h4cbzpfgq8a9lcdwjgwjr0npdgqk3j3f";
          stripLen = 2;
          extraPrefix = "kernel/";
        })
      ] ++ oA.patches;
    });
  });
in {
  boot.kernelPackages = pkgs.linuxPackages_latest;

  #boot.kernelPackages = linuxPackages_patched;

  #nixpkgs.config.packageOverrides = pkgs: {
    # swap out all of the linux packages
    #linuxPackages_latest = linuxPackages_patched;

    # make sure x11 will use the correct package as well
    #nvidia_x11 = linuxPackages_patched.nvidia_x11;
  #};

  # look in hardware-nvidia.nix
  #boot.kernelPatches = [{
  #  name = "nvidia-fix";
  #  patch = (pkgs.fetchpatch {
  #    url = "https://raw.githubusercontent.com/Frogging-Family/nvidia-all/master/patches/kernel-5.14.patch";
  #    sha256 = "042zyspddka1acmli9l4h4cbzpfgq8a9lcdwjgwjr0npdgqk3j3f";
  #    stripLen = 2;
  #    extraPrefix = "kernel/";
  #  });
  #}];
}
