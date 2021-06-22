{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  home-manager = {
    # install into /etc/profiles
    useUserPackages = true;
    useGlobalPkgs = true;
  };
}

