{ config, lib, pkgs, ... }:
let
  inherit (lib)
    mkEnableOption
    mkIf
    ;

  cfg = config.stupid.samba;
in
{
  options.stupid.samba = {
    enable = mkEnableOption "samba server";
    advertiseWin = mkEnableOption "Advertise shares to windows hosts";
  };

  config = mkIf cfg.enable {
    services.samba = {
      openFirewall = true;
      enable = true;
      shares = {
        share = {
          path = "/mnt/smb";
          "guest ok" = "yes";
          "read only" = "no";
          comment = "foo";
        };
      };
    };
    services.samba-wsdd = mkIf cfg.advertiseWin {
      openFirewall = true;
      enable = true;
    };
  };
}
