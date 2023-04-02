# HTPC

## TODO

Define the Firefox new tab url via Nix
Currently manually

## Components

* Dell Optiplex 7060 (9th Gen Intel) + 8GB RAM + 256GB SSD (OzBargain.com.au)
* Dell Optiplex 7060 HDMI Daughter board (eBay)
* WeChip G20 2.4Ghz Wireless Remote (Air Mouse) (Amazon)

Temporarily required:
* Keyboard (for pre-installation and post-installation configuration)
* Mouse (for initial Dell BIOS setup)

## Setup

1. Prepare USB installer stick
2. Setup BIOS, change boot-order to USB stick
3. Boot Nix
4. Follow installation manual (repeated below from 22.11 manual)
```
# attain root
sudo -i

# setup wifi (if required)
systemctl start wpa_supplicant
wpa_cli

> add_network
> set_network 0 ssid "<name>"
> set_network 0 psk "<shared key>"
> set_network 0 key_mgmt WPA-PSK
> enable_network 0
(Should see CTRL-EVENT-CONNECTED in output)

(setup DHCP reservation if required on router)

# partitions
parted /dev/sda -- mklabel gpt
(answer Yes)
parted /dev/sda -- mkpart primary 512MB -8GB
parted /dev/sda -- mkpart primary linux-swap -8GB 100%
parted /dev/sda -- mkpart ESP fat32 1MB 512MB
parted /dev/sda -- set 3 esp on

mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2
mkfs.fat -F 32 -n boot /dev/sda3

# installation
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon /dev/sda2

nixos-generate-config --root /mnt

vim /mnt/etc/nixos/configuration.nix

# Ensure the following are enabled
# networking.wireless.enable = true;
# networking.wireless.userControlled.enable = true;
# services.openssh.enable = true;
# services.openssh.permitRootLogin = "yes";
# networking.firewall.allowedTCPPorts = [ 22 ];

nixos-install
(set root password)

reboot

# bring up wifi (if required)
systemctl start wpa_supplicant
wpa_cli

# note: SSID is CASE-SENSITIVE
> add_network
> set_network 0 ssid "<name>"
> set_network 0 psk "<shared key>"
> set_network 0 key_mgmt WPA-PSK
> enable_network 0
(Should see CTRL-EVENT-CONNECTED in output)
```

On deployment machine
```
# copy /etc/nixos/hardware-configuration.nix
# an existing one is already in this repository and this step can be skipped
```

Continue on to deployment

## Deployment

```
cd nixops/htpc

# create a deployment db (if not done previously)
# note: if you change hardware drastically you can delete the nixops db
# rm ~/.nixops/deployments.nixops 
nixops create ./nixops.nix -d htpc

# deploy all
nixops deploy -d htpc

# deploy only to specific machines
nixops deploy -d htpc --check --include htpc-<name>
```

## Post-Setup

1. Boot
2. Add Wifi network via Gnome menu (if required)
3. Open new tab -> More Options
    1. Disable picture-in-picture
    2. Set the Firefox new-tab to "Custom URL" and enter the Jellyfin address

## Post-Deployment Administration

1. Change the nixops ip address from local to wireguard address

Note: may have to delete the nixops deployment db.
