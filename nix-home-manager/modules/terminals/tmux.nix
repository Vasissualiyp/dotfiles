{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.tmux;
in
{
  programs.tmux = {
    plugins = with pkgs;
	[
      tmuxPlugins.catpuccin
	];
  };

  options.programs.tmux = {
    enable = mkEnableOption "Tmux";

    extraConfig = mkOption {
      type = types.lines;
      default = "";
      description = "Additional tmux configuration.";
    };

    plugins = mkOption {
      type = types.listOf types.attrs;
      default = [];
      example = literalExample "with pkgs.tmuxPlugins; [ tmux-sensible ]";
      description = "List of tmux plugins to install.";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.tmux ];

    xdg.configFile."tmux/tmux.conf".text = ''
      # Your original tmux configuration goes here
      set-option -sa terminal-overrides ",xterm*:Tc"
      set-option -ga terminal-overrides ",xterm-256color:Tc"
      set -g mouse on
      
      #unbind C-b
      #set -g prefix C-q
      #bind C-q send-prefix
      
      # Vim style pane selection
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      
      # Start windows and panes at 1, not 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on
      
      # Use Alt-arrow keys without prefix key to switch panes
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D
      
      # Shift arrow to switch windows
      bind -n S-Left  previous-window
      bind -n S-Right next-window
      
      # Shift Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window
      
      set -g @catppuccin_flavour 'mocha'
      
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'christoomey/vim-tmux-navigator'
      #set -g @plugin 'dreamsofcode-io/catppuccin-tmux'
      set -g @plugin 'catppuccin/tmux'
      set -g @plugin 'tmux-plugins/tmux-yank'
      set -g @plugin 'tmux-plugins/tmux-resurrect'
      set -g @plugin 'tmux-plugins/tmux-continuum'
      
      #set -g @plugin 'pschmitt/tmux-ssh-split' # ssh-split plugin
      #set-option -g @ssh-split-h-key "|" #"|"
      #set-option -g @ssh-split-v-key "S" #"S"
      #set-option -g @ssh-split-w-key "c" #"C"
      #set-option -g @ssh-split-no-shell "false"
      
      set -g status-position top
      #set -g @catppuccin_window_left_separator "█"
      set -g @sessionx-zoxide-mode 'on'
      set -g @catppuccin_status_modules_left "session"
      set -g @catppuccin_status_modules_right "directory date_time"
      set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
      set -g @catppuccin_window_default_text "#W"
      set -g @catppuccin_status_left_separator  ""
      set -g @catppuccin_status_right_separator ""
      set -g @catppuccin_window_left_separator ""
      set -g @catppuccin_window_right_separator ""
      #set -g @catppuccin_window_middle_separator "█ "
      set -g @catppuccin_window_middle_separator ""
      set -g @catppuccin_window_number_position "left"
      set -g @catppuccin_window_default_fill "number"
      set -g @catppuccin_status_fill "icon"
      set -g @catppuccin_status_connect_separator "no"
      set -g @catppuccin_status_right_separator_inverse "no"
      set -g @catppuccin_session_text "#S"
      
      set -g @catppuccin_directory_color "#502B49"
      set -g @catppuccin_directory_icon "#{thm_fg}#[fg=default]"
      set -g @catppuccin_session_color "#37447a"
      set -g @catppuccin_session_icon "#{thm_fg}#[fg=default]"
      set -g @catppuccin_foreground_color "#7a8497"
      set -g @catppuccin_window_default_fill "number"
      
      
      set -g @continuum-restore 'on'
      
      bind-key b send-prefix # Requirement for remote sessions
      
      run '~/.tmux/plugins/tpm/tpm'
      
      set -g status-bg default
      set -g status-style bg=default
      
      # set vi-mode
      set-window-option -g mode-keys vi
      # keybindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # TPM (Tmux Plugin Manager) initialization
      run '~/.tmux/plugins/tpm/tpm'

      # TPM plugins
      ${concatStringsSep "\n" (map (plugin: "set -g @plugin '${plugin}'") cfg.plugins)}
      ${cfg.extraConfig}
    '';

    home.activation.tmuxPlugins = dag.entryAfter [ "writeBoundary" ] ''
      if [ ! -d $HOME/.tmux/plugins/tpm ]; then
        git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
      fi
    '';
  };
}

