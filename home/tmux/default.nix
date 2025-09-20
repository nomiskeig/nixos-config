{ config, pkgs, ... }:
{
  programs.tmux.enable = true;
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
# the rest  w
  programs.tmux.extraConfig = ''

        set-option -g default-terminal "xterm-256color"
        set-option -ga terminal-overrides ",alacritty:Tc"

        set -g prefix C-a
        #bind-key -n C-) next-window
       # bind-key -n C-( previous-window
        bind-key -n C-_ new-window
#        bind-key -n C-¹ select-window -t 1
#        bind-key -n C-² select-window -t 2
#        bind-key -n C-³ select-window -t 3
#        bind-key -n C-› select-window -t 4
#        bind-key -n C-‹ select-window -t 5
#        bind-key -n C-¢ select-window -t 6
#        bind-key -n C-¥ select-window -t 7
#        bind-key -n C-‚ select-window -t 8
#        bind-key -n C-‘ select-window -t 9
  '';

}
