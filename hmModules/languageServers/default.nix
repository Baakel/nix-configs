{ pkgs, lib, config, ... }:

{
  imports = [
    ./luals.nix
    ./treesitter.nix
    ./nills.nix
  ];

  lualsModule.enable = lib.mkDefault true;
  treesitterModule.enable = lib.mkDefault true;
  nillsModule.enable = lib.mkDefault true;
}
