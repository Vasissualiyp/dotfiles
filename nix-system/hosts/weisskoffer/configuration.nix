# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
	  #inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nicekoffer"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_CA.UTF-8";
    LC_IDENTIFICATION = "en_CA.UTF-8";
    LC_MEASUREMENT = "en_CA.UTF-8";
    LC_MONETARY = "en_CA.UTF-8";
    LC_NAME = "en_CA.UTF-8";
    LC_NUMERIC = "en_CA.UTF-8";
    LC_PAPER = "en_CA.UTF-8";
    LC_TELEPHONE = "en_CA.UTF-8";
    LC_TIME = "en_CA.UTF-8";
  };

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  
  # Audio
  hardware.pulseaudio.enable = true;

  # Configure keymap in X11
  #services.xserver = {
  #  layout = "us";
  #  xkbVariant = "";
  #};
  # Enable the desktop environment.

  services.xserver = {
    enable = true;
    autorun = true;
    xkb.layout = "us";
    xkb.options = "eurosign:e";

    # Enable the display manager (LightDM in this case)
    displayManager = {
      lightdm.enable = true;
      lightdm.greeter.enable = true;
      defaultSession = "none+bspwm"; # Default session can still be bspwm
    };

    # Enable bspwm
    windowManager.bspwm.enable = true;

    # Enable KDE Plasma
    desktopManager.plasma5.enable = true;
  };

  # Your existing configurations like DPI settings and environment variables
  console.font = "${pkgs.terminus_font}/share/consolefonts/ter-u38n.psf.gz";
  services.xserver.dpi = 180;
  environment.variables = {
    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5"; # Corrected typo from GDK_DPI_SCALEr to GDK_DPI_SCALE
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vasilii = {
    isNormalUser = true;
    description = "Vasilii";
    extraGroups = [ "networkmanager" "wheel" "audio"];
    packages = with pkgs; [];
  };
  users.users.evelyn = {
    isNormalUser = true;
    description = "Evelyn";
    extraGroups = [ "networkmanager" "wheel" "audio"];
    packages = with pkgs; [];
  };

  programs.vim.defaultEditor = true;
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    # Main essentials
    vim_configurable
    home-manager

    # Essentials
    neovim
    tmux
    ctags # Needed for vim to create tags
    pinentry-curses # for importing passphrase for pass
    pass
    kitty
    neofetch
    redshift
    gwenview
    feh
	
	# System
	unzip
	unrar
    dmenu
	xsel

    # Window Manager
    bspwm
    sxhkd
    picom
    rofi
    polybar
    ibus

    # Office
    flameshot
    thunderbird
    xournalpp
    zathura
    #zathura-djvu
    #zathura-pdf-mupdf

    #Xorg
    xorg.xorgserver
    # Xorg input modules
    xorg.xf86inputevdev
    xorg.xf86inputsynaptics
    xorg.xf86inputlibinput
    # Xorg video modules
    xorg.xf86videointel
    xorg.xf86videoati
    xorg.xf86videonouveau

    # Web
    qutebrowser
    firefox
    deluge
    discord

    # Coding
    python311Packages.pip
    python3
    nerdfonts
    nodejs
	gcc 
    gnumake 
    pkg-config
    autoconf
    automake
    binutils
    patch
    bison
    flex
    gettext
    libtool
   
    # Video
    vlc 
    arandr

    # Sound
    pavucontrol
    pamixer

    #adobe-source-han-sans-cn-fonts
    #adobe-source-han-sans-jp-fonts
    #adobe-source-han-sans-kr-fonts
    #alsa-firmware
    #alsa-plugins
    #alsa-utils
    #bash-completion
    #bind
    #blender
    #cppcheck
    #cronie
    #deluge-gtk
    #dhclient
    #diffutils
    #digimend-kernel-drivers-dkms-git
    #discord
    #dmenu
    #dmidecode
    #dmraid
    #dnsmasq
    #dolphin
    #downgrade
    #doxygen
    #exfatprogs
    #ffmpegthumbnailer
    #firewalld
    #gcc-fortran
    #gdb
    #geckodriver
    #gimp
    #gvim
    #hdf5
    #htop
    #ibus-libpinyin
    #impressive
    #inkscape
    #iwd
    #man-db
    #man-pages
    #mathpix-snipping-tool
    #minecraft-launcher
    #mutt
    #networkmanager-openconnect
    #networkmanager-openvpn
    #onedrive
    #opentabletdriver
    #pacman-contrib
    #pdf2svg
    #pdfjs
    #pipewire-alsa
    #pipewire-jack
    #pipewire-pulse
    #poppler-glib
    #python
    #python-capng
    #python-defusedxml
    #python-packaging
    #python-pip
    #python-pylint
    #python-pyqt5
    #python-tldextract
    #qjackctl
    #ripgrep
    #rsync
    #shellcheck
    #stalonetray
    #steam
    #sudo
    #synergy
    #texinfo
    #texlive-basic
    #texlive-binextra
    #texlive-latex
    #texlive-latexextra
    #thunar
    #thunar-archive-plugin
    #thunar-media-tags-plugin
    #thunar-volman
    #thunderbird
    #tldr
    #ttf-bitstream-vera
    #ttf-dejavu
    #ttf-liberation
    #ttf-nerd-fonts-symbols
    #ttf-opensans
    #usbutils
    #vi
    #warpd-git
    #whatsapp-for-linux
    #xbindkeys
    #xclip
    #xdg-desktop-portal-gtk
    #xdg-user-dirs
    #xdg-user-dirs-gtk
    #xdg-utils
    #xdotool
    #xterm
    #zoom
  ];

  ## Enable the desktop environment.
  #services.xserver.enable = true;
  #services.xserver.windowManager.bspwm.enable = true;
  #services.xserver.displayManager = { 
  #  defaultSession = "none+bspwm"; 
  #  setupCommands = ''
  #  my_laptop_external_monitor=$(${pkgs.xorg.xrandr}/bin/xrandr --query | grep 'DP-3 connected')
  #  if [[ $my_laptop_external_monitor = *connected* ]]; then
  #    ${pkgs.xorg.xrandr}/bin/xrandr --output DP-3 --primary --mode 3440x1440 --rate 100 --output eDP-1 --off
  #  else
  #    ${pkgs.xorg.xrandr}/bin/xrandr --output eDP-1 --mode 1920x1200 --rate 60
  #  fi
  #  '';
  #  lightdm = { 
  #    enable = true; 
  #    greeter.enable = true; 
  #  }; 
  #};
  #  
  ## Configure keymap in X11
  #services.xserver = {
  #  layout = "us";
  #  xkbVariant = "euro";
  #};

  environment.etc."sxhkd/sxhkdrc".source = /home/vasilii/.config/sxhkd/sxhkdrc;
  environment.etc."bspwm/bspwmrc".source = /home/vasilii/.config/bspwm/bspwmrc;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}


