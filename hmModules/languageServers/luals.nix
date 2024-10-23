{ pkgs, config, lib, ... }:

{
  options = {
    lualsModule.enable = lib.mkEnableOption "enables the luals module";
  };

  config = {
    home.packages = [
      pkgs.luajitPackages.lua-lsp
    ];
  };
}
