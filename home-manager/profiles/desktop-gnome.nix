{ pkgs, ... }:


#let
  #paperwm = pkgs.callPackage ../pkgs/paperwm { };
  #dash-to-dock = pkgs.callPackage ../pkgs/dash-to-dock { };
#in {
{
  home.packages = with pkgs; [
    adwaita-qt
    gnomeExtensions.appindicator
    # fix dash-to-dock on gnome 40
    gnomeExtensions.dash-to-dock
    #dash-to-dock

    # not working on gnome 41
    #gnomeExtensions.draw-on-your-screen
    # not working on gnome 40
    #gnomeExtensions.drop-down-terminal

    # fix paperwm on gnome 40
    # https://github.com/paperwm/PaperWM/issues/376
    gnomeExtensions.paperwm
    #paperwm
    gnomeExtensions.cleaner-overview
    gnomeExtensions.vertical-overview
    #gnomeExtensions.disable-workspace-switch-animation-for-gnome-40

    #gnomeExtensions.remove-dropdown-arrows
    gnomeExtensions.sound-output-device-chooser

    gnomeExtensions.dual-shock-4-battery-percentage

    # reposition notifications
    gnomeExtensions.panel-osd
    gnomeExtensions.notification-banner-position
    gnomeExtensions.top-panel-notification-icons
    gnomeExtensions.focusli

    gnomeExtensions.bring-out-submenu-of-power-offlogout-button

    gnomeExtensions.tray-icons-reloaded

    # speech synthesis
    speechd
    espeak-classic

    # themes
    adementary-theme
    capitaine-cursors
    #deepin.deepin-gtk-theme
    matcha-gtk-theme
    moka-icon-theme
    numix-icon-theme
    numix-icon-theme-circle
    numix-icon-theme-square
    pantheon.elementary-gtk-theme
    plata-theme
    stilo-themes
  ];
}
