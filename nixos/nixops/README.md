# Home network

Machines on home network managed by Nixops

## Raspberry Pi 4 B+

### Bootstrap

SSH is not enabled due to no-password on root/nixos accounts.
An authorized key must be added for this to work.

* [download nixos pi image](https://nixos.wiki/wiki/NixOS_on_ARM#Getting_the_installer)
* unzip
* dd onto sdcard
```
# determine what device the sdcard is
lsblk -p
dd if=nixos-sd-image-....img of=/dev/sdd bs=4M conv=fsync
```
* place sdcard in pi and boot

SSH is now started on boot, once connected to a network and `root` or `nixos` have a password.
`nixos` is the default user.

```
# set nixos password
passwd

# set root password
sudo su -
passwd
```

### Enable Wifi

```
sudo systemctl start wpa_supplicant

wpa_cli
> add_network
0
> set_network 0 ssid "myhomenetwork"
OK
> set_network 0 psk "mypassword"
OK
> set_network 0 key_mgmt WPA-PSK
OK
> enable_network 0
OK
```

* on PC
```
ssh-copy-id -i ~/.ssh/<key> nixos@<pi ip>
```

SSH will now be available (`ssh nixos@<ip>`)

### Base Configuration

* Generate hardware configuration, download system configuration, and apply
```
sudo su -
nixos-generate-config

# edit config as needed

# add hashed password to config
mkpasswd -m sha-512
# add to /etc/nixos/configuration.nix:
# users.nixos.hashedPassword = "<value>";

nix-channel --update

# use screen to permit deploy completion once ssh gets restarted
screen
nixos-rebuild switch && reboot
```

### Updating firmware
To benefit from updates and bug fixes from the vendor, we’ll start by updating Raspberry Pi firmware:

```
nix-shell -p raspberrypi-eeprom
mount /dev/disk/by-label/FIRMWARE /mnt
BOOTFS=/mnt FIRMWARE_RELEASE_STATUS=stable rpi-eeprom-update -d -a
```

### Deploying

Using NixOPS 1

NixOPS deploys all machines in a deployment.
There are arguments to deploy single machines.

```
$ cd <this dir>
$ nixops create ./nixops.nix -d <deployment name>
$ nixops deploy -d <deployment name>
```

Using NixOPS 2

```
$ cd <this dir>
$ nixops create --network .
$ nixops deploy --network .
```

## References

* https://opensourcelibs.com/lib/nixos-raspberry-pi-cluster
* https://nix.dev/tutorials/installing-nixos-on-a-raspberry-pi
* https://sgt.hootr.club/molten-matter/nixops-on-the-pi/
* https://eno.space/blog/2021/08/nixos-on-underpowered-devices
* https://nixos.wiki/wiki/NixOS_on_ARM/Raspberry_Pi_4
* https://kirarin.hootr.club/git/steinuil/nixos-config/src/branch/master/nixops/rpi.nix
* https://kirarin.hootr.club/git/steinuil/nixos-config/src/branch/master/hardware/rpi-3B+.nix
* https://mcwhirter.com.au/craige/blog/2019/Installing_NixOS_on_a_Headless_Raspberry_Pi3/
