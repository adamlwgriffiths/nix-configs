
# List profiles

    ls /nix/var/nix/profiles/

# Remove old Profile

    sudo rm /nix/var/nix/profiles/<profile>
    sudo nix-collect-garbage -d
    sudo nixos-rebuild boot

# Remove unused packages

    sudo nix-collect-garbage -d

# List dependencies of a binary

    nix-store -qR `which binary`

# Upgrade system

Test build

    nixos-rebuild build

Build and activate

    nixos-rebuild switch
