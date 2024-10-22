{ pkgs, lib, config, ... }:

{
  imports = [
    ./programs/zsh.nix
    ./programs/starship.nix
  ];
}
