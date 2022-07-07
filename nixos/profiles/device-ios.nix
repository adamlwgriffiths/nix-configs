{ pkgs, ... }:

{
  # https://oprtr.org/en/how-to-access-an-iphone-in-linux/
  # $ idevicepair pair
  # $ mkdir -p ~/iPhone
  # $ ifuse ~/iPhone
  services.usbmuxd.enable = true;
  environment.systemPackages = with pkgs; [
    ifuse
    libimobiledevice
  ];
}
