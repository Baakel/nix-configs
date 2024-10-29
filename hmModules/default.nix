{ pkgs, lib, config, specialArgs, ... }:

{
  imports = [
    ./programs/zsh.nix
    ./programs/starship.nix
    ./programs/eza.nix
    ./programs/bat.nix
    ./programs/fzf.nix
    ./programs/btop.nix
    ./programs/ripgrep.nix
    ./programs/transmission.nix
    ./programs/make.nix
    ./programs/node.nix
    ./programs/sysstat.nix
    ./programs/git.nix
    ./programs/dust.nix
    ./programs/fd.nix
    ./languageServers
  ];

  zshModule.enable = lib.mkDefault true;
  starshipModule.enable = lib.mkDefault true;
  ezaModule.enable = lib.mkDefault true;
  batModule.enable = lib.mkDefault true;
  fzfModule.enable = lib.mkDefault true;
  btopModule.enable = lib.mkDefault true;
  ripgrepModule.enable = lib.mkDefault true;
  transmissionModule.enable = lib.mkDefault false;
  nodeModule.enable = lib.mkDefault true;
  makeModule.enable = lib.mkDefault true;
  sysstatModule.enable = lib.mkDefault true;
  gitModule.enable = lib.mkDefault true;
  dustModule.enable = lib.mkDefault false;
  fdModule.enable = lib.mkDefault false;

  home.shellAliases = {
    hms = "home-manager switch --flake ~/.config/home-manager#${specialArgs.hmProfile}";
    vim = "nvim";
    ehm = "nvim ~/.config/home-manager/home.nix";
    sudo = "sudo_with_env";
    nix-clean = "nix-collect-garbage -d";
    szsh = "source ~/.zshrc";
    ls = "eza";
    gp = "git push";
  };
}
