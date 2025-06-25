{ config, lib, pkgs, ... }:
let inherit (lib)
	mkEnableOption
	mkIf
	;
	cfg = config.stuff.waybar;
in {
	options.stuff.waybar.enable = mkEnableOption "Waybar";

	config = mkIf cfg.enable {
		programs.waybar = {
			enable = true;
			style = ''
				@define-color base   #1e1e2e;
        @define-color mantle #181825;
        @define-color crust  #11111b;

        @define-color text     #cdd6f4;
        @define-color subtext0 #a6adc8;
        @define-color subtext1 #bac2de;

        @define-color surface0 #313244;
        @define-color surface1 #45475a;
        @define-color surface2 #585b70;

        @define-color overlay0 #6c7086;
        @define-color overlay1 #7f849c;
        @define-color overlay2 #9399b2;

        @define-color blue      #89b4fa;
        @define-color lavender  #b4befe;
        @define-color sapphire  #74c7ec;
        @define-color sky       #89dceb;
        @define-color teal      #94e2d5;
        @define-color green     #a6e3a1;
        @define-color yellow    #f9e2af;
        @define-color peach     #fab387;
        @define-color maroon    #eba0ac;
        @define-color red       #f38ba8;
        @define-color mauve     #cba6f7;
        @define-color pink      #f5c2e7;
        @define-color flamingo  #f2cdcd;
        @define-color rosewater #f5e0dc;

        * {
          margin-top: 2px;
          border: none;
          border-radius: 0;
          min-height: 0;
          font-family: Material Design Icons, Maple Mono NF;
          font-size: 13px;
        }

        window#waybar {
          background-color: rgba(0,0,0,0);
          transition-property: background-color;
          transition-duration: 0.5s;
        }

        window#waybar.hidden {
          opacity: 0.5;
        }

        #workspaces {
          background-color: @base;
          border-radius: 0px 16px 16px 0px;
        }

        #workspaces button {
          all: initial; /* Remove GTK theme values (waybar #1351) */
          min-width: 0; /* Fix weird spacing in materia (waybar #450) */
          box-shadow: inset 0 -3px transparent; /* Use box-shadow instead of border so the text isn't offset */
          padding: 6px 18px;
          margin: 6px 3px;
          border-radius: 8px;
          color: @mauve;
        }

        #workspaces button.focused {
          background-color: @surface0;
        }

        #workspaces button:hover {
         box-shadow: inherit;
         text-shadow: inherit;
         background-color: @crust;
        }

        #workspaces button.urgent {
          background-color: @red;
          color: @text;
        }

        #memory,
        #custom-power,
        #battery,
        #backlight,
        #pulseaudio,
        #network,
        #clock,
        #tray {
          border-radius: 16px;
          margin: 6px 3px;
          padding: 6px 12px;
          background-color: @base;
          color: @base;
        }

        #tray {
          color: @text;
        }

        #custom-power {
          margin-right: 6px;
        }

        #custom-logo {
          padding-right: 7px;
          padding-left: 7px;
          padding-top: 6px;
          margin-left: 10px;
          font-size: 20px;
          border-radius: 16px 0px 0px 16px;
          color: @sapphire;
          background-color: @base;
        }

        #custom-logo button:hover {
          background-color: @crust;
        }

        #memory {
          background-color: @peach;
        }

        #backlight {
          background-color: @peach;
        }

        #pulseaudio {
          background-color: @yellow;
        }

        #network {
          background-color: @yellow;
          padding-right: 17px;
        }

        #clock {
          font-family: Maple Mono NF;
          background-color: #cba6f7;
        }

        #custom-power {
          background-color: #f2cdcd;
          margin-right: 10px;
        }


        tooltip {
        border-radius: 8px;
        padding: 15px;
        background-color: #131822;
        }

        tooltip label {
        padding: 5px;
        background-color: #131822;
        }'';
			settings = {
        bar = {
          layer = "top";
          position = "top";
          spacing = 0;
          height = 34;
          # modules
          modules-left = [
            "custom/logo"
	          "sway/workspaces"
          ];
          modules-center = [
            "clock"
          ];
          modules-right = [
            "tray"
            "memory"
						#            "pulseaudio"
            "custom/power"
          ];
          "custom/logo" = {
            on-click = "rofi -show drun";
            tooltip = false;
            format = " 󱄅 ";
          };
          "sway/workspaces" = {
            on-click = "activate";
            format = "{icon}";
            format-icons = {
              default = "";
              active = "";
              urgent = "";
            };
            persisent-workspaces = {
              "1" = [ ];
              "2" = [ ];
              "3" = [ ];
              "4" = [ ];
              "5" = [ ];
            };
          };
          memory = {
            interval = 5;
            format = " {}%";
            max-length = 10;
          };
          tray.spacing = 10;
          clock = {
            tooltip-format = "<tt>{calendar}</tt>";
            format = "  {:%a, %d %b %Y}  {:%H:%M}";
            calendar = {
              mode = "year";
              mode-mon-col = 3;
              weeks-pos = "right";
              on-scroll = 1;
              on-click-right = "mode";
              format = {
                months = "<span color='#f2cdcd'><b>{}</b></span>";
                days = "<span color='#f5c2e7'><b>{}</b></span>";
                weeks = "<span color='#a6e3a1'><b>{}</b></span>";
                weekdays = "<span color='#f9e2af'><b>{}</b></span>";
                today = "<span color='#f38ba8'><b><u>{}</b></span>";
              };
            };
          };
        };
      };
		};
	};
}
