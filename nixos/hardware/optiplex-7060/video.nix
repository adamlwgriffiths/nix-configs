{ config, lib, pkgs, modulesPath, ... }:

{
    boot.initrd.kernelModules = [ "i915" ];

    hardware.opengl = {
        enable = true;
        extraPackages = with pkgs; [
            intel-media-driver # LIBVA_DRIVER_NAME=iHD
            vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
            vaapiVdpau
            libvdpau-va-gl
        ];
    };

    environment.variables = {
        VDPAU_DRIVER = lib.mkIf config.hardware.opengl.enable (lib.mkDefault "va_gl");
    };
}