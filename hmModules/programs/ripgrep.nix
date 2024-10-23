{ pkgs, lib, config, ... }:

{
  options = {
    ripgrepModule.enable = lib.mkEnableOption "enables ripgrepModulue";
  };

  config = lib.mkIf config.ripgrepModule.enable {
    programs.ripgrep = {
      enable = true;
    };
  };
}
