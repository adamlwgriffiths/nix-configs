{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      git
      killall
      links2
      neovim
      ntfs3g
      parted
      pciutils
      unzip
      usbutils
      wget
      wol
      vim
      zip
    ];

    # list of valid shells
    # if a user's shell is not in this list, they are considered to be a system account
    # and will not appear in GDM, etc
    shells = with pkgs; [ bashInteractive zsh nushell ];

    variables = {
      EDITOR = "nvim";
    };
  };
}
