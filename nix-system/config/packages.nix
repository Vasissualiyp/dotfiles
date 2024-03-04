{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

	# MAKE SURE TO CHOOSE THE REQUIRED LATEX SCHEME!
	texlive.combined.scheme-full   # long download ~5 mins
	#texlive.combined.scheme-basic # fast download, but not all functionalities present

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
	stdenv.cc.cc.lib
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
	qrencode
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
}
