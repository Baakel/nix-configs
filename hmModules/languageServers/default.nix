{ pkgs, lib, config, ... }:

{
  imports = [
    ./luals.nix
    ./treesitter.nix
  ];

  lualsModule.enable = lib.mkDefault true;
  treesitterModule.enable = lib.mkDefault true;
}
