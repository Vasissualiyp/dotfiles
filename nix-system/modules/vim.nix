{ pkgs, ... }:

let
  myVim = pkgs.vim_configurable.override {
    python3 = pkgs.python3;
  };
in
{
  programs.vim.defaultEditor = true;

  environment.systemPackages = with pkgs; [
    (myVim.customize {
      name = "vim-with-python3";
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-nix ]; # load plugins on startup
      };
      vimrcConfig.customRC = ''
        " custom vimrc settings
      '';
    })
  ];
}
