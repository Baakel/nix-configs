{ pkgs, lib, config, ... }:

{
  options = {
    transmissionModule.enable = lib.mkEnableOption "enables the transmissionModule";
  };

  config = lib.mkIf config.transmissionModule.enable {
    home.packages = [
      pkgs.transmission_4-qt
    ];
  };
}
