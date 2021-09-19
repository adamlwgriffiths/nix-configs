{ config, pkgs, options, ... }:
{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      videoDrivers = [ "nvidia" ];
    };
  };
}
