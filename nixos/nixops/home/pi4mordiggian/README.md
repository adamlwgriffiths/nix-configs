# Raspberry Pi 4 B+

NextCloud server

## Mordiggian

__The Charnel God, The Great Ghoul__

Lord of Zul-Bha-Sair, Morddoth	A shape-shifting cloud of darkness.

## Configure wireguard

https://dataswamp.org/~solene/2021-05-18-nixos-wireguard.html

## Building

$ cd <parent dir of this dir>
$ nixops create --network . -d pi4mordiggian
$ nixops deploy -d pi4mordiggian

## References

Wifi: https://mcwhirter.com.au/craige/blog/2019/Setting_Up_Wireless_Networking_with_NixOS/

# https://sgt.hootr.club/molten-matter/nixops-on-the-pi/
# https://eno.space/blog/2021/08/nixos-on-underpowered-devices
* https://nixos.wiki/wiki/NixOS_on_ARM/Raspberry_Pi_4
* https://kirarin.hootr.club/git/steinuil/nixos-config/src/branch/master/nixops/rpi.nix
* https://kirarin.hootr.club/git/steinuil/nixos-config/src/branch/master/hardware/rpi-3B+.nix
* https://mcwhirter.com.au/craige/blog/2019/Installing_NixOS_on_a_Headless_Raspberry_Pi3/
