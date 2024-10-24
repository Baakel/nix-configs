{ pkgs, lib, config, ... }: 

{
  options = {
    starshipModule.enable = lib.mkEnableOption "enables starshipModule";
  };

  config = lib.mkIf config.starshipModule.enable {
    programs.starship = {
      enable = true;
      settings = {
        format = lib.concatStrings [
          "[](color_red)"
          "$os"
          "$username"
          "$directory"
          "$\{custom.git_symbol\}"
          "$git_branch"
          "$git_commit"
          "$git_status"
          "[](fg:prev_bg)"
          "$fill"
          "$nix_shell"
          "$cmd_duration"
          "$jobs"
          "$rust"
          "$memory_usage"
          "$time"
          "[ ](fg:prev_bg)"
          "$line_break"
          "$character"
        ];

        right_format = lib.concatStrings [
          "$status"
        ];

        character = {
          success_symbol = "[❯](fg:color_green)";
          error_symbol = "[❯](fg:color_red)";
          vimcmd_symbol = "[❮](fg:color_green)";
          vimcmd_replace_one_symbol = "[❮](fg:color_purple)";
          vimcmd_replace_symbol = "[❮](fg:color_purple)";
          vimcmd_visual_symbol = "[❮](fg:color_blue)";
        };

        cmd_duration = {
          min_time = 800;
          show_milliseconds = false;
          format = "[](bg:prev_bg fg:color_purple)[ $duration  ]($style)";
          style = "bg:color_purple fg:color_bg1";
        };

        directory = {
          home_symbol = " ~";
          format = "[ ](bg:color_bg1 fg:color_blue)[$read_only]($read_only_style)[$path ]($style)";
          style = "bold fg:color_blue bg:color_bg1";
          read_only_style = "bold bg:color_bg1 fg:color_purple";
          read_only = " ";
          truncation_symbol = "../";
          truncate_to_repo = true;
          before_repo_root_style = "bg:color_bg1 fg:color_bg3";
          repo_root_style = "bg:color_bg1 fg:color_green";
          repo_root_format = "[ ](bg:color_bg1 fg:color_blue)[$read_only]($read_only_style)[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path ]($style)";
          fish_style_pwd_dir_length = 1;
          truncation_length = 5;
        };

        line_break = {
          disabled = false;
        };

        fill = {
          symbol = " ";
        };

        git_branch = {
          # format = "[ ](fg:prev_bg bg:color_aqua)[$symbol$branch(:$remote_branch) ]($style)";
          format = "[ $symbol$branch(:$remote_branch) ]($style)";
          symbol = " ";
          style = "fg:color_bg1 bg:color_aqua";
        }; 

        git_commit = {
          format = "[ ](fg:prev_bg bg:color_green)[󰜘 $hash $tag$tag_symbol]($style)";
          tag_disabled = true;
          tag_symbol = "󰓹 ";
          style = "fg:color_bg1 bg:color_green";
        };

        git_state = {
          style = "fg:color_fg0 bg:color_red";
          format = "[ ](fg:prev_bg bg:color_red)[$state( $progress_current/$progress_total)]($style)";
        };

        git_status = {
          ahead = "[󰈸$count ](fg:color_green bg:color_bg1)";
          behind = "[$count ](fg:color_green bg:color_bg1)";
          conflicted = "[$count ](fg:color_red bg:color_bg1)";
          untracked = "[$count ](fg:color_blue bg:color_bg1)";
          diverged = "[󰦻$count ](fg:color_purple bg:color_bg1)";
          stashed = "[$count ](fg:color_aqua bg:color_bg1)";
          modified = "[󰙨$count ](fg:color_yellow bg:color_bg1)";
          staged = "[󱓞$count ](fg:color_yellow bg:color_bg1)";
          renamed = "[󰑕$count ](fg:color_yellow bg:color_bg1)";
          deleted = "[󰗨$count ](fg:color_red bg:color_bg1)";
          style = "fg:color_green bg:color_bg1";
          format = "([ ](fg:prev_bg bg:color_bg1)[$all_status$ahead_behind]($style))";
        };

        jobs = {
          format = "[](fg:color_bg1 bg:prev_bg)[ $symbol$number ]($style)";
          style = "bg:color_bg1 fg:color_blue";
          symbol = "󰚌";
        };

        memory_usage = {
          threshold = -1;
          symbol = "󰍛";
          format = "[](fg:color_aqua bg:prev_bg)[ $ram_pct $symbol ]($style)";
          disabled = false;
          style = "fg:color_bg1 bg:color_aqua";
        };

        nix_shell = {
          format = "[](fg:color_bg1 bg:prev_bg)[ $symbol$state(\($name\)) ]($style)";
          style = "bg:color_bg1 fg:color_purple";
          symbol = "󱄅";
          heuristic = true;
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
          style = "bg:color_red fg:color_fg0";
          format = "[ $symbol ]($style)";
          symbols = {
            Arch = "";
            Debian = "";
            Ubuntu = "";
            Raspbian = "";
          };
        };

        rust = {
          symbol = "";
          style = "bg:color_orange";
          format = "[](fg:color_orange bg:prev_bg)[[ $symbol( $version) ](fg:color_fg0 bg:color_orange)]($style)";
        };
        
        status = {
          symbol = "";
          not_executable_symbol = "";
          not_found_symbol = "󰈈";
          sigint_symbol = "󰭿";
          signal_symbol = "󰚩";
          format = "[$symbol $status:$signal_name(\($common_meaning\))]($style)";
          style = "fg:color_red";
          map_symbol = true;
          pipestatus = true;
          disabled = false;
        };

        time = {
          disabled = false;
          format = "[](bg:prev_bg fg:color_blue)[ $time 󰥔]($style)";
          style = "bg:color_blue fg:color_bg1";
        };
        
        username = {
          style_user = "fg:color_aqua bg:color_bg1";
          style_root = "fg:color_red bg:color_bg1";
          format = "[](bg:color_bg1 fg:prev_bg)[ $user ]($style)";
          show_always = true;
        };

        custom = {
          git_symbol = {
            command = "~/.config/starship/git_symbol.sh";
            require_repo = true;
            detect_folders = [".git"];
            format = "[ ](bg:color_aqua fg:prev_bg)[$output]($style)";
            style = "fg:color_bg1 bg:color_aqua";
          };
        };
      };

    };

    home.file = {
      ".config/starship/git_symbol.sh".source = ../../hmModules/programs/starship/git_symbol.sh;
    };
  };
}
