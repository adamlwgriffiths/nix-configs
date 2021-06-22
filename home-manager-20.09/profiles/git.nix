{ config, ... }:
{
  programs.git = {
    enable = true;
    userName = "Adam Griffiths";
    userEmail = "adam.lw.griffiths@gmail.com";
  };
}
