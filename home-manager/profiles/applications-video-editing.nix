{ pkgs, ... }:

{
  home.packages = with pkgs; [
    recapp
    #olive-editor
    openshot-qt
    #lightworks
    #shotcut
  ];
}
