{ pkgs, lib, config, ... }:

{
  options = {
    sysstatModule.enable = lib.mkEnableOption "enables the sysstat module";
  };

  config = lib.mkIf config.sysstatModule.enable {
    home.packages = [
      pkgs.sysstat
    ];
  };
}
