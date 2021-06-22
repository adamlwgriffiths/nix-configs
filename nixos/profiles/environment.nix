{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      git
      killall
      links
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

    variables = {
      EDITOR = "nvim";
    };
  };
}
