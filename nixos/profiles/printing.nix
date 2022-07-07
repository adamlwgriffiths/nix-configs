{ config, lib, pkgs, ... }:

{
  # https://nixos.wiki/wiki/Printing
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    nssmdns
    canon-cups-ufr2
    cnijfilter2
  ];
}
