{ pkgs, config, lib, ... }:

{
  options = {
    lualsModule.enable = lib.mkEnableOption "enables the luals module";
  };

  config = {
    home.packages = [
      # pkgs.luajitPackages.lua-lsp
      pkgs.lua-language-server
      pkgs.luajitPackages.luarocks
      pkgs.lua51Packages.lua
      pkgs.lua51Packages.jsregexp
    ];
  };
}
