{ pkgs, lib, config, ... }:

{
  imports = [
    ./programs/zsh.nix
    ./programs/starship.nix
    ./programs/eza.nix
    ./programs/bat.nix
    ./programs/fzf.nix
  ];

  fzfModule.enable = true;
}
