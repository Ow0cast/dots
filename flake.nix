{
	description = ":3";

	nixConfig = {
		experimental-features = [ "flakes" "nix-command" ];
		extra-substituters = [
			"https://cache.nixos.org"
			"https://nix-community.cachix.org"
		];
		extra-trusted-public-keys = [
			"cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
			"nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
		];
	};

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs:
		with inputs;
		let specialArgs = { inherit inputs self; }; in {
		nixosConfigurations = {
			athena = nixpkgs.lib.nixosSystem {
				inherit specialArgs;
				modules = [
					home-manager.nixosModules.home-manager
					./modules/nixos
					./hosts/athena
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.nikki = import ./home/nikki/athena.nix;
						home-manager.extraSpecialArgs = specialArgs;
					}
				];
			};
		};

		homeConfigurations = {
			"nikki@athena" = home-manager.lib.homeManagerConfiguration {
				pkgs = import nixpkgs { system = "x86_64-linux"; };
				modules = [
					./modules/home
					./home/nikki
				];
			};
		};
		formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
	};
}

