# parted, avoiding alignment issues
```
$ parted /dev/nvme0n1
> mklabel gpt
> mkpart primary 1GiB -4%
> mkpart primary linux-swap -4% 100%
> mkpart ESP fat32 1MiB 1GiB
> set 3 boot on

#$ parted /dev/sda
#> mklabel gpt
#> mkpart primary 0% 100%

$ mkfs.ext4 -L nixos /dev/nvme0n1p1
$ mkswap -L swap /dev/nvme0n1p2
$ mkfs.fat -F 32 -n boot /dev/nvme0n1p3
```

# separate home
```
$ mkfs.ext4 -L home /dev/sda1

$ mount /dev/disk/by-label/nixos /mnt

$ mkdir -p /mnt/boot
$ mount /dev/disk/by-label/boot /mnt/boot

$ mkdir -p /mnt/home
$ mount /dev/disk/by-label/home /mnt/home

$ swapon /dev/nvme0np2

$ nixos-generate-config --root /mnt
$ vim /mnt/etc/nixos/configuration.nix

$ nixos-install

$ reboot
$ sudo su -
$ passwd adam
```

# nix-hardware
```
$ nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
$ nix-channel --update

Then import specific modules

imports = [
    <nixos-hardware/lenovo/thinkpad/x220>
    ./hardware-configuration.nix
];
```

# home-manager channel
```
$ nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
$ nix-channel --update

$ nixos-rebuild switch

$ home-manager switch
```
Alt+F2 > restart

# Rebuild
```
$ nix-channel update
$ nixos-rebuild switch
```

# Use existing configurations

```
$ sudo su -
$ ln -s /path/to/nixos/machine/panther/default.nix /etc/nixos/configuration.nix
$ exit
$ ln -s /path/to/home-manager/home.nix ~/.config/nixpkgs/home.nix
```
