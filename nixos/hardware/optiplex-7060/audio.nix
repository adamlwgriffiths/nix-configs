{ config, lib, pkgs, modulesPath, ... }:

{
    sound.enable = true;
    nixpkgs.config.pulseaudio = true;
    hardware.pulseaudio = {
        enable = true;
        daemon.config = {
            default-sample-rate = "48000";
            flat-volumes = "no";
            resample-method = "speex-float-5";
        };
    };
}