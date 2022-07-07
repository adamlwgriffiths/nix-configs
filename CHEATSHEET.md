
# List profiles

    ls /nix/var/nix/profiles/

# Remove old profiles

    sudo nix-env --delete-generations old
    sudo nix-store --gc

# Remove specific Profile

    sudo rm /nix/var/nix/profiles/<profile>
    sudo nix-collect-garbage -d
    sudo nixos-rebuild boot

# Remove unused packages

    sudo nix-collect-garbage -d

# List dependencies of a binary

    nix-store -qR `which binary`

# Update system

Test build

    nixos-rebuild build

Build and activate

    nixos-rebuild switch

# Upgrade system

    sudo su -
    VERSION="21.11"
    nix-channel --add https://nixos.org/channels/nixos-$VERSION nixos
    nix-channel --add https://github.com/nix-community/home-manager/archive/release-$VERSION.tar.gz home-manager
    nix-channel --update
    nixos-rebuild switch

    exit

    VERSION="21.11"
    nix-channel --add https://github.com/nix-community/home-manager/archive/release-$VERSION.tar.gz home-manager
    nix-channel --update
    home-manager switch
