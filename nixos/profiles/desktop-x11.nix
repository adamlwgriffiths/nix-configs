{ config, pkgs, options, ... }:
{
  services = {
    xserver = {
      enable = true;
    };
  };
}
