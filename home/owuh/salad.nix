{ pkgs, ... }:

{
  home.username = "owuh";
  home.homeDirectory = "/home/owuh";

  home.packages = [ pkgs."maple-mono-NF" ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  stupid.shell.enable = true;
  stupid.desktop.enable = true;
  stupid.browser.enable = true;
  #programs.firefox.enable = true;

  programs.git = {
    enable = true;
    userName = "owuh";
    userEmail = "owuh@wayland.best";
    extraConfig.init.defaultBranch = "main";
  };
}
