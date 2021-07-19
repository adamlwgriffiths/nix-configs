{ config, pkgs, ... }:
{
  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";
  time.timeZone = "Australia/Melbourne";
}
