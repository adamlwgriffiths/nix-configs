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
      # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;
      desktopManager.gnome3.enable = true;
    };

    udev.packages = with pkgs; [
      gnome3.gnome-settings-daemon
    ];
  };
}
