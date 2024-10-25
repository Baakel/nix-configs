{ pkgs, config, lib, ... }:

{
  options = {
    nillsModule.enable = lib.mkEnableOption "enables the nix language server module";
  };

  config = lib.mkIf config.nillsModule.enable {
    home.packages = [
      pkgs.nixd
      pkgs.nixfmt
    ];
  };
}
