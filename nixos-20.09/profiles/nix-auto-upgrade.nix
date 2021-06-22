{ config, pkgs, ... }:

{
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };
}
