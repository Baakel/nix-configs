{ lib, config, specialArgs, ... }:

{
  options = {
    gitModule.enable = lib.mkEnableOption "enables the git module and configs based on profile";
  };

  config = lib.mkIf config.gitModule.enable {
    programs.git = {
      enable = true;
      userEmail = if specialArgs.hmProfile == "work-vm" then "diego.navarro@dealfront.com" else "thrauglor@gmail.com";
      userName = if specialArgs.hmProfile == "work-vm" then "dnavarro" else "baakel";
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
