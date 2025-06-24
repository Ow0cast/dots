{ pkgs, ... }:

{
	home.username = "nikki";
	home.homeDirectory = "/home/nikki";

	home.packages = [ pkgs.maple-mono.NF ];

	home.stateVersion = "25.05";

	programs.home-manager.enable = true;
	
	stuff = {
		sway.enable = true;
		waybar.enable = true;
		rofi.enable = true;

		kitty.enable = true;
		zsh.enable = true;

		miscThemes.enable = true;
	};

	programs.git = {
		enable = true;
		userName = "owuh";
		userEmail = "owuh@wayland.best";
		extraConfig.init.defaultBranch = "main";
	};
}
