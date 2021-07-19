{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./vim.nix
  ];

  # https://github.com/digital-asset/dev-env
  # TODO: nix-direnv
  # https://github.com/nix-community/nix-direnv
  programs.direnv = {
    enable = true;
    enableNixDirenvIntegration = true;
  };
  services.lorri.enable = true;

  programs.bash = {
    enable = true;
    historyControl = [ "erasedups" "ignoredups" "ignorespace" ];
    bashrcExtra = ''
      eval "$(direnv hook bash)"
    '';

    shellAliases = {
      ll = "ls -l";
      # copies file contents to clipboard
      # usage: `clip filename`
      clip = "xclip -sel cli < ";
    };
  };

  #options.environment = {
  #  variables = {
  #    EDITOR = "nvim";
  #  };
  #};
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}

