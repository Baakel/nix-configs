{ pkgs, lib, config, specialArgs, ... }:

{
  options = {
    gitModule.enable = lib.mkEnableOption "enables the git module and configs based on profile";
  };

  config = lib.mkIf config.gitModule.enable {
    programs.git = {
      enable = true;
      userEmail = "thrauglor@gmail.com";
      userName = "baakel";
      extraConfig = {
        core = {
          editor = "nvim";
        };
        init = {
          defaultBranch = "main";
        };
        pull = {
          rebase = true;
        };
        alias = {
          thaw = "update-index --no-assume-unchanged";
          freeze = "update-index --assume-unchanged";
        };
      };
    };
  };
}
