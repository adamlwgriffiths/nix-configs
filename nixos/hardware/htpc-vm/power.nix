{ config, lib, pkgs, modulesPath, ... }:

{
    services.thermald.enable = lib.mkDefault true;
    services.acpid.enable = true;
}