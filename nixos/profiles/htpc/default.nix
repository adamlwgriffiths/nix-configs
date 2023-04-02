# https://blog.stigok.com/2020/06/19/nixos-xserver-openbox-auto-start-browser-application.html
# https://discourse.nixos.org/t/how-to-configure-nixos-for-kiosk-or-fullscreen-applications/21855
# https://gist.github.com/datakurre/cd29a985351e6b8c9bbc04532e5f9df0
# https://wiki.archlinux.org/title/XDG_Autostart
{ config, lib, pkgs, ... }:

let
    username = "htpc";
    secrets = import ../../../secrets/htpc.nix;
    jellyfin-url = secrets.jellyfin-url;
inherit
    (pkgs) writeScript;
in {

    imports = [
        <home-manager/nixos>
        ./gnome-manager.nix
        #../wireguard/htpc.nix
        ../boot-splash.nix
        ../desktop-gnome.nix
        ../desktop-x11.nix
        ../keyboard-us.nix
        ../nix-unfree.nix
        ../power.nix
        ../ssh-server.nix
        ../timezone-melbourne.nix
    ];

    boot.cleanTmpDir = true;

    # only show the last 3 boot configurations
    boot.loader.grub.configurationLimit = 3;

    #
    # Networking
    #
    networking.firewall.enable = true;
    networking.firewall.allowedTCPPorts = [
        # openssh
        22
        # remote desktop
        3389
    ];


    networking.usePredictableInterfaceNames = false;

    networking.useDHCP = lib.mkDefault true;
    networking.interfaces.eth0.useDHCP = lib.mkDefault true;
    networking.interfaces.wlan0.useDHCP = lib.mkDefault true;
    networking.networkmanager.enable = true;

    # OpenSSH
    services.openssh.enable = lib.mkDefault true;
    services.openssh.permitRootLogin = "yes";

    #
    # X11
    #
    services.xserver = {
        libinput.enable = lib.mkDefault true;

        displayManager.autoLogin.enable = true;
        displayManager.autoLogin.user = username;
        displayManager.gdm.autoLogin.delay = 0;
    };
    services.gnome.gnome-remote-desktop.enable = true;

    #
    # Users
    #
    users = {
        users.root = {
            hashedPassword = secrets.users.root.hashedPassword;
            openssh.authorizedKeys.keys = secrets.users.root.openssh.authorizedKeys;
        };

        users.nixos = {
            isNormalUser = true;
            hashedPassword = secrets.users.nixos.hashedPassword;
            openssh.authorizedKeys.keys = secrets.users.nixos.openssh.authorizedKeys;

            group = "nixos";
            extraGroups = [ "wheel" "audio" "video" ]
                ++ lib.optional config.networking.networkmanager.enable "networkmanager";
        };
        groups.nixos = {};

        users."${username}" = {
            isNormalUser = true;
            hashedPassword = secrets.users."${username}".hashedPassword;

            group = username;
            extraGroups = [ "audio" "video" ]
                ++ lib.optional config.networking.networkmanager.enable "networkmanager";
        };
        groups.htpc = {};
    };

    home-manager.useGlobalPkgs = true;

    programs.dconf.enable = true;

    home-manager.users."${username}" = { pkgs, ... }: {
        home.stateVersion = "22.11";
        #home.packages = with pkgs; [];
        programs.bash.enable = true;

        #
        # CHANGED TO FIREFOX
        # Jellyfin doesnt support media keys!
        # https://github.com/jellyfin/jellyfin-media-player/issues/3
        #
        # Auto start Jellyfin
        # sourced from:
        # /run/current-system/sw/share/applications/com.bithub.iwalkton3.jellyfin-media-player.desktop
        #home.file.".config/autostart/jellyfinmediaplayer.desktop".text = ''
        #    [Desktop Entry]
        #    Version=1.0
        #    Name=Jellyfin Media player
        #    Comment=Desktop client for Jellyfin
        #    Exec=jellyfinmediaplayer --fullscreen --tv
        #    Icon=com.github.iwalkton3.jellyfin-media-player
        #    Terminal=false
        #    Type=Application
        #    StartupWMClass=jellyfinmediaplayer
        #    Categories=AudioVideo;Video;Player;TV;
        #'';
        home.file.".config/autostart/firefox.desktop".text = ''
            [Desktop Entry]
            Version=1.0
            Name=Jellyfin
            Comment=Firefox Jellyfin Kiosk
            Exec=firefox -kiosk "${jellyfin-url}" -fullscreen
            Icon=com.github.iwalkton3.jellyfin-media-player
            Terminal=false
            Type=Application
            StartupWMClass=jellyfinmediaplayer
            Categories=AudioVideo;Video;Player;TV;
        '';

        dconf.settings = {
            "org/gnome/shell" = {
                # found in:
                # /run/current-system/sw/share/applications/
                favorite-apps = [
                    "com.github.iwalton3.jellyfin-media-player.desktop"
                    "firefox.desktop"
                    "org.gnome.Console.desktop"
                ];
            };
            "org/gnome/desktop/interface" = {
                color-scheme = "prefer-dark";
                enable-hot-corners = false;
            };

            # on screen keyboard
            "org/gnome/desktop/a11y/applications" = {
                screen-keyboard-enabled = true;
            };

            # remote desktop
            "org/gnome/desktop/remote-desktop/rdp" = {
                # enable RDP
                enable = true;
                # enable control of the screen
                view-only = false;
            };

            # Disable Screensaver locking
            # Disable screensaver
            "org/gnome/desktop/screensaver" = {
                lock-enabled = false;
                idle-activation-enabled = false;
                logout-enabled = false;
            };
            # actual
            "org/gnome/desktop/session" = {
                # doesn't seem to take, has to be done manually
                idle-delay = "0";
            };
            "org/gnome/settings-daemon/plugins/power" = {
                idle-dim = false;
                sleep-inactive-ac-type = "nothing";
                # blank
                # suspend
                # hibernate
                # shutdown
                power-button-action = "suspend";
            };
        };
    };

    gnome-manager = {
        enable = true;
        user = username;
        keybindings = {};
        extensions = [
            "dash-to-dock"
            "no-overview"
            "appindicator"
            "tray-icons-reloaded"
            "bring-out-submenu-of-power-offlogout-button"
            # may not work unless using wg through network-manager
            "wireguard-vpn-extension"
        ];
    };

    #
    # Apps
    #
    environment.systemPackages = with pkgs; [
        gnome.adwaita-icon-theme
        jellyfin-media-player
        firefox
        vim
        networkmanager

        gnome.dconf-editor
    ];

    # remove programs
    environment.gnome.excludePackages = (with pkgs; [
        gnome-photos
        gnome-tour
    ]) ++ (with pkgs.gnome; [
        cheese # webcam tool
        gnome-music
        gedit # text editor
        epiphany # web browser
        geary # email reader
        evince # document viewer
        gnome-characters
        gnome-calendar
        gnome-maps
        gnome-weather
        gnome-contacts
        gnome-clocks
        simple-scan
        totem # video player
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
    ]);
}
