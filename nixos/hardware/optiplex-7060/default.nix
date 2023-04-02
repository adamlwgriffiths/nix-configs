{ config, lib, pkgs, modulesPath, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./audio.nix
        ./bootloader.nix
        ./power.nix
        ./ssd.nix
        ./video.nix
    ];
}