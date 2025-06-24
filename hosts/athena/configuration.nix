{ config, pkgs, ... }:

{
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "athena";

	networking.networkmanager.enable = true;

	users.users.nikki = {
		isNormalUser = true;
		extraGroups = ["networkmanager" "wheel"];
		packages = with pkgs; [
			neovim
		];
		shell = pkgs.zsh;
	};
	programs.zsh.enable = true;

	environment.systemPackages = with pkgs; [
		nixd
	];

	services.openssh.enable = true;

	nixpkgs.config = {
		allowUnfree = true;
	};

	stuff.home-manager = {
		enable = true;
		users.nikki.enable = true;
	};

	system.stateVersion = "25.05";
}
