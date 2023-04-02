{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # create bootable windows usb sticks
    # woeusb-ng doesnt seem to do anything
    woeusb
    #woeusb-ng
  ];
}
