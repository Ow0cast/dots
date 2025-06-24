{ config, lib, pkgs, ... }:
let inherit (lib)
	mkEnableOption
	mkIf
	;
	cfg = config.stuff.kitty;
in {
	options.stuff.kitty.enable = mkEnableOption "Kitty";

	config = mkIf cfg.enable {
		programs.kitty = {
			enable = true;
			font.name = "Maple Mono NF";
			font.size = 16;
			theme = "Catppuccin-Mocha";
			settings = {
				scrollback_lines = 100000;
				enable_bell_audio = false;
				confirm_os_window_close = false;

				tab_bar_min_tabs = 1;
				tab_bar_edge = "bottom";
				tab_bar_style = "powerline";
				tab_powerline_style = "slanted";
				tab_title_template = "{title}{ ' :{}:'.format(num_windows) if num_windows > 1 else ''}";
			};
		};
	};
}
