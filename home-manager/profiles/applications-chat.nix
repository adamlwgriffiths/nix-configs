{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # apps
    element-desktop
    fractal
    mumble
  ];
}
