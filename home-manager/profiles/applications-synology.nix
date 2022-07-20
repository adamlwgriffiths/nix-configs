{ pkgs, ... }:
{
  home.packages = with pkgs; [
    synology-drive-client
  ];
}
