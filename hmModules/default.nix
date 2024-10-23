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
  ];

  zshModule.enable = lib.mkDefault true;
  starshipModule.enable = lib.mkDefault true;
  ezaModule.enable = lib.mkDefault true;
  batModule.enable = lib.mkDefault true;
  fzfModule.enable = lib.mkDefault true;
  btopModule.enable = lib.mkDefault true;
  ripgrepModule.enable = lib.mkDefault true;
  transmissionModule.enable = lib.mkDefault false;

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
