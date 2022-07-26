{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # tools
    bind
    cmake
    conda
    docker-compose
    gnumake
    niv
    nix-index
    python3Full
    sshfs

    # editors
    atom
    emacs

    # demo tools
    asciinema
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      # nix-shell selector
      arrterian.nix-env-selector

      # python
      ms-python.python
      ms-pyright.pyright

      # nix
      bbenoist.nix

      # collaboration
      ms-vsliveshare.vsliveshare
    ];
    userSettings = {
    };
  };
}
