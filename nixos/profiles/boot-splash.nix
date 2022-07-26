{ config, pkgs, ... }:

{
  boot = {
    plymouth.enable = true;

    #kernelParams = [
    #  "quiet"
    #  "plymouth.ignore-serial-consoles"
    #  "vt.global_cursor_default=0"
    #];

    #extraModprobeConfig = ''
    #  options nvidia_drm modeset=1
    #'';

    #loader.grub = {
    #  gfxmodeEfi = "3440x1440";
    #};
  };
}
