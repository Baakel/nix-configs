{ pkgs, lib, config, ... } : {

  options = {
    zshModule.enable = lib.mkEnableOption "enables zshModule";
  };

  config = lib.mkIf config.zshModule.enable {

    programs.zsh = {
      enable = true;
      enableCompletion = true;

      envExtra = ''
        COLORTERM=truecolor
        PATH=/nix/var/nix/profiles/default/bin:$PATH
      '';
      initExtra = ''
          function sudo_with_env() {
            sudo env PATH=$PATH "$@"
          }
      '';

      history = {
        append = true;
        size = 10000;
        ignoreDups = true;
        share = true;
      };

      oh-my-zsh = {
        enable = true;
      };

      # prezto = {
      #   enable = true;
      #   caseSensitive = false;
      #   # color = true;
      # };

      syntaxHighlighting = {
        enable = true;
      };
    };

  };
}
