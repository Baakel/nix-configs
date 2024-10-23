{ pkgs, lib, config, ... }:

{
  options = {
    nodeModule.enable = lib.mkEnableOption "enables the node module";
  };

  config = lib.mkIf config.nodeModule.enable {
    home.packages = [
      pkgs.nodejs_22
    ];
  };
}
