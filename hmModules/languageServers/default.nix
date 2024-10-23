{ pkgs, lib, config, ... }:

{
  imports = [
    ./luals.nix
  ];

  lualsModule.enable = lib.mkDefault true;
}
