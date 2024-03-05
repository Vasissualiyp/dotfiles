{ config, pkgs, lib, ... }:

let
  cfg = config.services.redshift;
in
{
  options.services.redshift = {
    enable = lib.mkEnableOption "Redshift";

    latitude = lib.mkOption {
      type = lib.types.str;
      default = "43.7";
      description = "Your current latitude.";
    };

    longitude = lib.mkOption {
      type = lib.types.str;
      default = "-79.4";
      description = "Your current longitude.";
    };

    temperature = {
      day = lib.mkOption {
        type = lib.types.int;
        default = 6500;
        description = "Colour temperature to use during the day.";
      };
      
      night = lib.mkOption {
        type = lib.types.int;
        default = 1000;
        description = "Colour temperature to use at night.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.redshift = {
      enable = true;
      provider = "manual";
      latitude = cfg.latitude;
      longitude = cfg.longitude;
      extraOptions = [
        "-t ${toString cfg.temperature.day}:${toString cfg.temperature.night}"
      ];
    };
  };
}
