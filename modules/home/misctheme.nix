{ config, lib, pkgs, ... }:
let inherit (lib)
	mkEnableOption
	mkIf
	;
	cfg = config.stuff.miscThemes;
in {
	options.stuff.miscThemes.enable = mkEnableOption "Misc. themes";

	config = mkIf cfg.enable {
		gtk.cursorTheme = {
			package = pkgs.google-cursor;
			name = "GoogleDot-Black";
			size = 32;
		};

		home.pointerCursor = {
			package = pkgs.google-cursor;
			name = "GoogleDot-Black";
			size = 32;
		};
	};
}
