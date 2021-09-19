{ config, pkgs, options, ... }:
{
  # enable steam hardware workarounds
  programs.steam.enable = true;
  # programs.steam.remotePlay.openFirewall = true;
  # programs.steam.dedicatedServer.openFirewall = true;

  hardware = {
    # steam (above not working)
    opengl.enable = true;
    opengl.driSupport32Bit = true;
    pulseaudio.support32Bit = true;

    # video acceleration
    opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  };
}
