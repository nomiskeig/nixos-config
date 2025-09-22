{ config, pkgs, ... }:
{
  programs.tmux.enable = true;
  /*
    programs.tmux.plugins = [
      {
        plugin = pkgs.tmuxPlugins.tmux-floax;
        extraConfig = ''
          set -g @floax-bind '-n C-\'
          set -g @floax-change-path 'false'
          set -g @floax-width '90%'
          set -g @floax-height '90%'
        '';
      }
    ];
  */
  # the rest  w
  programs.tmux.extraConfig = ''
     set-option -g default-terminal "xterm-256color"
     set-option -ga terminal-overrides ",alacritty:Tc"
     set-option -g mouse on
     set -g prefix C-a
     #bind-key -n C-) next-window
    # bind-key -n C-( previous-window
     bind-key -n C-_ new-window
     bind-key -n 'C-\' if-shell "[ \$(tmux list-panes | wc -l | bc) -eq 1 ]" {
         split-window -c '#{pane_current_path}'
              } {
         if-shell '[ -n "$(tmux list-panes -F ''
  + "''#F''"
  + ''
    | grep Z)" ]' {
                   select-pane -t:.+
               } {
               resize-pane -Z -t0
               }
           }
     bind -n M-1 select-window -t 1
     bind -n M-2 select-window -t 2
     bind -n M-3 select-window -t 3
     bind -n M-4 select-window -t 4
     bind -n M-5 select-window -t 5
     bind -n M-6 select-window -t 6
     bind -n M-7 select-window -t 7
     bind -n M-8 select-window -t 8
     bind -n M-9 select-window -t 9
     bind -n M-0 select-window -t 0
     set -g base-index 1
  '';

}
