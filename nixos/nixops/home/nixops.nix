{
  network.description = "home";
  network.enableRollback = true;

  network.storage.legacy = {
    databasefile = "~/.nixops/deployments.nixops";
  };

  # Mordiggian - Pi4 NextCloud
  # The Charnel God, The Great Ghoul
  # Lord of Zul-Bha-Sair, Morddoth
  # A shape-shifting cloud of darkness.
  "pi4mordiggian" = { config, pkgs, ... }: {
    # wired
    #deployment.targetHost = "192.168.0.129";
    # wireless
    deployment.targetHost = "192.168.0.109";
    #deployment.targetUser = "nixos";
    imports = [ ./pi4mordiggian/default.nix ];
  };
/*
  # Abholos - Pi4 VPN
  # Devourer in the Mist
  # A grey festering blob of infinite malevolence, described as the lesser brother of Tsathoggua or spawn of Cthulhu, born from his bile and tears.
  "pi4vpn" = { config, pkgs, ... }: {
    deployment.targetHost = "192.168.0.129";
    deployment.targetUser = "nixos";
    imports = [
      ./pi4vpn/default.nix
    ];
  };

  # Sho-Gath - Pi4 Plex
  # The God in the Box, The Big Black Thing
  # A dark smoky column, with red malevolent eyes and a grotesque face, imprisoned inside a vintage box.
  "pi4plex" = { config, pkgs, ... }: {
    deployment.targetHost = "192.168.0.130";
    deployment.targetUser = "nixos";
    imports = [
      ./pi4plex/default.nix
    ];
  };
*/
}
