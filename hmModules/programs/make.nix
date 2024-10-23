{ pkgs, lib, config, ... }:

{
  options = {
    makeModule.enable = lib.mkEnableOption "enable makeModule";
  };

  config = lib.mkIf config.makeModule.enable {
    home.packages = [
      pkgs.gnumake
    ];
  };
}
