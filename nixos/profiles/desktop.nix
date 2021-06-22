# TODO: abstract nvidia
{ config, pkgs, options, ... }:
{
  environment = {
    # work-around nvidia/webkit issue
    # https://github.com/NixOS/nixpkgs/issues/32580
    variables = {
      WEBKIT_DISABLE_COMPOSITING_MODE = "1";
    };

    systemPackages = with pkgs; [
      gnome3.adwaita-icon-theme
    ];
  };

  # List services that you want to enable:
  services = {
    xserver = {
      enable = true;
      layout = "us";
      videoDrivers = [ "nvidia" ];

      # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    udev.packages = with pkgs; [
      gnome3.gnome-settings-daemon
    ];
  };

  # enable steam hardware workarounds
  #options.programs.steam.enable = true;
  programs.steam.enable = true;

  hardware = {
    # steam (above not working)
    opengl.enable = true;
    opengl.driSupport32Bit = true;
    pulseaudio.support32Bit = true;

    # video acceleration
    opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  };
}
