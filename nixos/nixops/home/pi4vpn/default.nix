
# Abholos
# Devourer in the Mist
# A grey festering blob of infinite malevolence,
# described as the lesser brother of Tsathoggua or spawn of Cthulhu,
# born from his bile and tears.

{
  imports = [
    ../../../machines/pi4vpn/default.nix
  ];

  nixpkgs.localSystem = {
    system = "aarch64-linux";
    config = "aarch64-unknown-linux-gnu";
  };
}
