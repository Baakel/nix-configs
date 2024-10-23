{ pkgs, lib, config, specialArgs, ... }:

{
  options = {
    btopModule.enable = lib.mkEnableOption "enables btopModule";
  };

  config = lib.mkIf config.btopModule.enable {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "Default";
      };
    };
  };
}
