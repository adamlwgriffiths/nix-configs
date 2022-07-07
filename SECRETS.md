# Secret files

Description of the layout of secrets files

## secrets/pi4.nix

```
users.root = {
  hashedPassword = "< generate with `mkpasswd -m sha-512` >";
  openssh.authorizedKeys = [
    "< ssh public key >"
  ];
};
users.nixos = {
  hashedPassword = "< generate with `mkpasswd -m sha-512` >";
  openssh.authorizedKeys = [
    "< ssh public key >"
  ];
};

networks = {
  < ssid > = {
    psk = "<hashed psk taken from `wpa_supplicant <ssid> <psk>`";
  };
};
```
