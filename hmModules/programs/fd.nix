{ config, lib, pkgs, ... }:

{
  options = {
    fdModule.enable = lib.mkEnableOption "enable the fd module";
  };

  config = lib.mkIf config.fdModule.enable {
    # home.packages = [
    #   pkgs.fd
    # ];

    programs.fd = {
      enable = true;
      hidden = true;
    };
  };
}
