{ pkgs, ... }:

{
  #home.sessionVariables = {
  #  WEBKIT_DISABLE_COMPOSITING_MODE = "1";
  #};

  home.packages = with pkgs; [
    adwaita-qt
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.draw-on-your-screen
    gnomeExtensions.drop-down-terminal
    gnomeExtensions.paperwm
    gnomeExtensions.remove-dropdown-arrows
    gnomeExtensions.sound-output-device-chooser
    #gnomeExtensions.topicons-plus

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

