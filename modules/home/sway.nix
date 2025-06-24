{ config, lib, pkgs, ... }:
let inherit (lib)
	mkEnableOption
	mkIf
	;
	cfg = config.stuff.sway;
in {
	options.stuff.sway.enable = mkEnableOption "Sway";

	config = mkIf cfg.enable {
		wayland.windowManager.sway = {
			enable = true;
			extraConfig = ''
				client.focused					#cba6f7  #1e1e2e  #cdd6f4  #f5e0dc  #cba6f7
				client.focused_inactive #6c7086  #1e1e2e  #cdd6f4  #f5e0dc  #6c7086
				client.unfocused				#6c7086  #1e1e2e  #cdd6f4  #f5e0dc  #6c7086
			'';
			config = {
				modifier = "Mod4";
				terminal = "kitty";
				gaps = {
					inner = 3;
					outer = 2;
				};
				window = {
					border = 1;
					titlebar = false;
				};
				bars = [
					{ command = "waybar"; }
				];
			};
		};
	};
}
