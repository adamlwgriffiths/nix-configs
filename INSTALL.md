# parted, avoiding alignment issues

    $ parted /dev/nvme0n
    > mklabel gpt
    > mkpart primary 1GiB -4%
    > mkpart primary linux-swap -4% 100%
    > mkpart ESP fat32 1MiB 1GiB
    > set 3 boot on

    $ parted /dev/sda
    > mklabel gpt
    > mkpart primary 0% 100%

    $ mkfs.ext4 -L nixos /dev/nvme0np1
    $ mkswap -L swap /dev/nvme0np2
    $ mkfs.fat -F 32 -n boot /dev/nvme0np3

# separate home

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

# home-manager channel

    $ nix-channel --add https://github.com/rycee/home-manager/archive/release-20.03.tar.gz home-manager
    $ nix-channel --update

    $ nixos-rebuild switch

    $ home-manager switch

Alt+F2 > restart
