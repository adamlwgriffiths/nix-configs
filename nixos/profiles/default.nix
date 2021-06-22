{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  boot.cleanTmpDir = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";
  time.timeZone = "Australia/Melbourne";

  nixpkgs.overlays = [
    (import ../overlays/nixops.nix)
  ];
}

