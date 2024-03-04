{ config, pkgs, ... }:
let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
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

      ${builtins.readFile ./lua/plugins/treesitter.lua}
	'';
#${toLuaFile ./lua/plugins/treesitter.lua}
    plugins = with pkgs.vimPlugins; [
      #plenary

      #-- SimPylFold --
      #require('plugins.simpylfold')
      #-- Inkscape (Gilles Catelle's snippets) --
      #require('keymaps.inkscape')
      #-- Noterius --
      #require('keymaps.noterius')
      #vim.cmd('source ~/.config/nvim/vimscript/noterius.vim')
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
      {
	  plugin = telescope-nvim;
	  config = toLua "${builtins.readFile ./lua/plugins/telescope.lua}\n${builtins.readFile ./lua/keymaps/telescope.lua}";
	  }
	  vim-tmux-navigator
      {
	  plugin = harpoon;
	  config = toLua "${builtins.readFile ./lua/plugins/harpoon.lua}\n${builtins.readFile ./lua/keymaps/harpoon.lua}";
	  }
      #ripgrep
	  leap-nvim
	  copilot-vim
	  vim-css-color
      #mason-nvim
      #mason-lspconfig
	  nvim-lspconfig
	  SimpylFold
      {
	  plugin = vimtex;
	  config = "source ~/.dotfiles/nvim/vimscript/vimtex.vim \nlua << EOF\n${builtins.readFile ./lua/keymaps/limelight.lua}EOF\n";
	  }
      #vim-tex-fold
      {
	  plugin = vimwiki;
	  config = toLuaFile ./lua/plugins/vimwiki.lua;
	  }
      {
	  plugin = calendar-vim;
	  config = toLuaFile ./lua/plugins/calendar.lua;
	  }
      {
	  plugin = vim-smoothie;
	  config = toLuaFile ./lua/plugins/smoothie.lua;
	  }
      {
	  plugin = limelight-vim;
	  config = toLua "${builtins.readFile ./lua/plugins/limelight.lua}\n${builtins.readFile ./lua/keymaps/limelight.lua}";
	  }
      {
	  plugin = lightline-vim;
	  config = toLuaFile ./lua/plugins/lightline.lua;
	  }
	  vimspector
	  fzf-vim
      #fzf
	  startup-nvim
	  telescope-ultisnips-nvim
      {
	  plugin = ultisnips;
	  config = toLuaFile ./lua/keymaps/ultisnips.lua;
	  }
	  vim-snippets
    ];

  };

}
