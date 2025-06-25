{ config, lib, pkgs, ... }:
let inherit (lib)
	mkEnableOption
	mkIf
	;
	cfg = config.stuff.browser;
in {
	options.stuff.browser.enable = mkEnableOption "Firefox";

	config = mkIf cfg.enable {
		programs.firefox = {
			enable = true;
			policies = {
				DisableTelemetry = true;
			};
		};
	};
}  
