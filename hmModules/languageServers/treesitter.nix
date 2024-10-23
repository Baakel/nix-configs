{ pkgs, lib, config, ... }:

{
  options = {
    treesitterModule.enable = lib.mkEnableOption "enables the tree-sitter cli module";
  };

  config = lib.mkIf config.treesitterModule.enable {
    home.packages = [
      pkgs.tree-sitter
    ];
  };
}
