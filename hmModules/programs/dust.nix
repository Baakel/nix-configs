{ pkgs, lib, config, ... }:

{
  options = {
    dustModule.enable = lib.mkEnableOption "enables dust package";
  };

  config = lib.mkIf config.dustModule.enable {
    home.packages = [
      pkgs.dust
    ];
  };
}
