{ config, lib, pkgs, modulesPath, ... }:

{
    services.fstrim.enable = lib.mkDefault true;
}