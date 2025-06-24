{ config, lib, pkgs, ... }:
let inherit (lib)
	mkEnableOption
	mkIf
	;
	cfg = config.stuff.rofi;
in {
	options.stuff.rofi.enable = mkEnableOption "Rofi";

	config = mkIf cfg.enable {
		programs.rofi = {
			enable = true;
			theme = ''
				* {
					bg-col: #1e1e2e;
					bg-col-light: #cba6f7;
					border-col: #cba6f7;
        	selected-col: #cba6f7;
        	blue: #89b4fa;
        	fg-col: #cdd6f4;
        	fg-col2: #bac2de;
        	grey: #6c7086;
        	width: 600;
        }
			'';
		};
	};
}
