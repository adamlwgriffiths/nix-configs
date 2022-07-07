
# Sho-Gath
# The God in the Box, The Big Black Thing
# A dark smoky column, with red malevolent eyes and a grotesque face, imprisoned inside a vintage box.

{
  imports = [
    ../../../machines/pi4plex/default.nix
  ];

  nixpkgs.localSystem = {
    system = "aarch64-linux";
    config = "aarch64-unknown-linux-gnu";
  };
}
