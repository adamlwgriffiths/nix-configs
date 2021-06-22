{ pkgs, config, ... }:
{
  programs.bash = {
    shellAliases = {
      "vi" = "nvim";
      "vim" = "nvim";
    };
  };
}
