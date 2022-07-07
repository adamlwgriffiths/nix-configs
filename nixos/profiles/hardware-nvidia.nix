{ config, pkgs, options, ... }:
{
  services = {
    xserver = {
      videoDrivers = [ "nvidia" ];
    };
  };
}
