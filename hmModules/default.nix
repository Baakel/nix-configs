{ pkgs, lib, config, ... }:

{
  imports = [
    ./programs/zsh.nix
    ./programs/starship.nix
    ./programs/eza.nix
    ./programs/bat.nix
    ./programs/fzf.nix
  ];

  zshModule.enable = true;
  starshipModule.enable = true;
  ezaModule.enable = true;
  batModule.enable = true;

  home.shellAliases = {
    hms = "home-manager switch";
    vim = "nvim";
    ehm = "nvim ~/.config/home-manager/home.nix";
    sudo = "sudo_with_env";
    nix-clean = "nix-collect-garbage -d";
    szsh = "source ~/.zshrc";
    ls = "eza";
    gp = "git push";
    gethost = "echo 'this is the host $(hostname)'";
  };
}
