{ config, lib, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "baakel";
  home.homeDirectory = "/home/baakel";
  targets.genericLinux.enable = true;

  # programs.transmission = {
  #   enable = true;
  # };
  #
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
    };
  };

  programs.zsh = {
    enable = true;
    # enableCompletion = true;

    envExtra = ''
      COLORTERM=truecolor
    '';
    initExtra = ''
	source $HOME/.cargo/env
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

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = ["--cmd cd"];
  };

  programs.atuin = {
    enable = true;
    # enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    settings = {
     format = lib.concatStrings [
       "[](color_orange)"
       "$os"
       "$username"
       "[](bg:color_yellow fg:prev_bg)"
       "$directory"
       "$git_branch"
       "$git_status"
       "[](fg:color_aqua bg:color_blue)"
       "$python"
       "[](fg:color_blue bg:color_bg3)"
       "$docker_context"
       "[](fg:color_bg3 bg:color_bg1)"
       "[ ](fg:color_bg1)"
       "$fill"
       "$jobs"
       "$line_break"
       "$character"
     ];
     # right_format = lib.concatStrings [
     #   "$time"
     #   "$rust"
     # ];

     line_break = {
       disabled = false;
     };

     fill = {
       symbol = " ";
     };

     palette = "gruvbox_dark";

     palettes = {
       gruvbox_dark = {
         color_fg0 = "#fbf1c7";
	 color_bg1 = "#3c3836";
	 color_bg3 = "#665c54";
	 color_blue = "#458588";
	 color_aqua = "#689d6a";
	 color_green = "#98971a";
	 color_orange = "#d65d0e";
	 color_purple = "#b16286";
	 color_red = "#cc241d";
	 color_yellow = "#d79921";
       };
     };

     os = {
       disabled = false;
       style = "bg:color_orange fg:color_fg0";
     };

     rust = {
       symbol = "";
       style = "bg:color_orange";
       format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_orange)]($style)";
     };

     time = {
       disabled = false;
     };
    };

  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = lib.fileContents ./nvim_configs/init.lua;
	#    plugins = with pkgs.vimPlugins; [
	#        { plugin = gruvbox-material;
	#   config = ''
	#   # priority = 1000,
	#   config = funtion()
	#     vim.g.gruvbox_material_foreground = 'mix'
	#     vim.g.gruvbox_material_background = 'hard'
	#     vim.g.gruvbox_material_better_ferformance = 1
	#     vim.cmd.colorscheme 'gruvbox-material'
	#   end,
	#   '';
	# }
    # ];
  };
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    # pkgs.neovim
    pkgs.atuin
    pkgs.starship
    pkgs.qbittorrent
    pkgs.transmission_4-qt

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/baakel/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "nvim";
  };

  home.shellAliases = {
    hms = "home-manager switch";
    vim = "nvim";
    ehm = "nvim ~/.config/home-manager/home.nix";
    sudo = "sudo_with_env";
    nix-clean = "nix-collect-garbage -d";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
