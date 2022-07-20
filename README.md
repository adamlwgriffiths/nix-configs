# Nix config files

Examples of system and home-manager configurations.

I make no claims that any of these are good.

# How to use

1. Run through the [installation steps](INSTALL.md) to bootstrap NixOS.
2. Symlink the Nix files
```
$ sudo su -
$ ln -s /path/to/nixos/machine/panther/default.nix /etc/nixos/configuration.nix
$ exit
$ ln -s /path/to/home-manager/home.nix ~/.config/nixpkgs/home.nix
```
3. Enable nixos-hardware / home-manager
```
$ nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
$ nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
$ nix-channel --update
```
4. Re-build
```
$ nix-channel update
$ nixos-rebuild switch
```
