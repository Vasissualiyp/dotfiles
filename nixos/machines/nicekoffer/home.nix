{ config, pkgs, ... }:
let 

  bashAliases = {
    ls = "ls --color=auto";
    grep = "grep --colour=auto";
    egrep = "egrep --colour=auto";
    fgrep = "fgrep --colour=auto";
    cdls = "cd \"$1\" && ls";
    cdf = "cd \"$(find . -type d | fzf)\"";
    endall = "$HOME/scripts/system/shutdown.sh";
    pushall = "$HOME/scripts/git/git_push_all.sh";
    pullall = "$HOME/scripts/git/git_pull_all.sh";
    addgit = "echo \"$(pwd),$(git remote get-url origin)\" >> $HOME/scripts/git/github_tracked_dirs.csv";
    screenoff = "xset dpms force off";
    cald = "cal -m";
    invert = "$HOME/scripts/custom_docs_editing/invert_pdf.sh";
    zd = "zathura \"$1\"";
    zl = "zathura -c $HOME/.config/zathura/zathurarc-light \"$1\"";
    zdf = "zathura $(fzf)";
    zlf = "zathura -c $HOME/.config/zathura/zathurarc-light $(fzf)";
    shgpt = "source $HOME/env/venv/bin/activate; source $HOME/.bash_profile";
    srcenv = "source ./env/bin/activate";
    devenv = "python -m venv env; source ./env/bin/activate; pip install numpy scipy matplotlib";
    cpp = "xclip -selection clipboard -o";
    remcon = "if [ $# -eq 0 ]; then $HOME/scripts/web/remoteconnect.sh; else $HOME/scripts/web/remoteconnect.sh \"$1\"; fi";
    stup = "$HOME/scripts/startup/startup.sh";
    wifissh = "$HOME/scripts/web/establish_ssh_over_wifi.sh \"$1\"";
    xopdf = "$HOME/scripts/custom_docs_editing/xopdf.sh";
    note = "$HOME/Software/Noterius/note.sh";
    bslt = "$HOME/scripts/bspwm_scripts/bspwm-layouts.sh";
  };



{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vasilii";
  home.homeDirectory = "/home/vasilii";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

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

  programs.bash.enable = true;
  programs.bash.shellAliases = bashAliases;
 

  programs.neovim = {
    enable = true;
  };
  programs.git = {
    enable = true;
	userName = "Vasissualiyp";
	userEmail = "vpustovoit@cita.utoronto.ca";
	aliases = {
	  pu = "push";
	  co = "checkout";
	  cm = "commit";
	};
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/vasilii/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
     EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
