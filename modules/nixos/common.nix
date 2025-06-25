{ config, lib, inputs, self, ... }:
let
	inherit (lib)
		mkEnableOption
		mkIf
		;
	cfg = config.stuff.common;
in {
	options.stuff.common.enable = mkEnableOption "Common settings";

	config = mkIf cfg.enable {
		nix.settings.experimental-features = ["nix-command" "flakes"];
		security.rtkit.enable = true;
		hardware.pulseaudio.enable = false;
		services.pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
		};
	};
}
