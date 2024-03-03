{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

	extraLuaConfig = ''
      ${builtins.readFile ./lua/config/global_parameters.lua  }
      
      -- This is needed to setup the path, which is essential for nvim on NixOS to work
      ${builtins.readFile ./lua/config/path_setup.lua}
      
      -- Load config settings
      ${builtins.readFile ./lua/keymaps/global.lua}
      ${builtins.readFile ./lua/config/colors.lua}
      ${builtins.readFile ./lua/config/digraphs.lua}

	'';
    plugins = with pkgs.vimPlugins; [
      #plenary
      nvim-web-devicons
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-bash
        p.tree-sitter-vim
        p.tree-sitter-python
        p.tree-sitter-lua
        p.tree-sitter-c
	  ]))
      nvim-treesitter-context
      nvim-treesitter-textobjects
      telescope-nvim
      vim-tmux-navigator
      harpoon
      #ripgrep
      leap-nvim
      copilot-vim
      vim-css-color
      #mason-nvim
      #mason-lspconfig
      nvim-lspconfig
      SimpylFold
      vimtex
      #vim-tex-fold
      vimwiki
      calendar-vim
      vim-smoothie
      limelight-vim
      lightline-vim
      vimspector
      fzf-vim
      #fzf
      startup-nvim
      telescope-ultisnips-nvim
      ultisnips
      vim-snippets
    ];

  };

}
