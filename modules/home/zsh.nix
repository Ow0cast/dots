{ config, lib, pkgs, ... }:
let inherit (lib)
	mkEnableOption
	mkIf
	;
	cfg = config.stuff.zsh;
in {
	options.stuff.zsh.enable = mkEnableOption "Zsh";

	config = mkIf cfg.enable {
		programs.zsh = {
			enable = true;
			enableCompletion = true;
			autosuggestion.enable = true;
			syntaxHighlighting.enable = true;

			plugins = [
				{
					name = "fzf-tab";
					src = pkgs.zsh-fzf-tab;
				}
				{
					name = "zsh-autopair";
					src = pkgs.zsh-autopair;
				}
				{
					name = "zsh-syntax-highlighting";
					src = pkgs.zsh-syntax-highlighting;
				}
				{
					name = "zsh-autosuggestions";
					src = pkgs.zsh-autosuggestions;
				}
			];

			shellAliases = {
				cat = "bat --style=plain";

				nv = "nvim";

				rf = "rm -rf";
			};
		};

		programs.starship.enable = true;

		programs.lsd.enable = true;
		programs.bat.enable = true;
		programs.fzf.enable = true;
		
		programs.pay-respects.enable = true;

		programs.autojump.enable = true;
	};
}
