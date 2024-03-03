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
      # add other plugins here
    ];

    #plugins = with pkgs.vimPlugins; [
    #  plenary-nvim

    #  # Treesitter
    #  nvim-web-devicons
    #  (nvim-treesitter.withPlugins (p: [
    #  	tree-sitter-textobjects
    #  ])))

    #  telescope-nvim
    #  vim-tmux-navigator
    #  harpoon
    #  ripgrep
    #  leap-nvim
    #  copilot-vim

    #  'ap/vim-css-color',

    #  'williamboman/mason.nvim',
    #  'williamboman/mason-lspconfig.nvim',
    #  'neovim/nvim-lspconfig',

    #  # Python
    #  'tmhedberg/SimpylFold',

    #  # Latex
    #  'lervag/vimtex',
    #  'matze/vim-tex-fold',

    #   # Vimwiki
    #  {
    #    "vimwiki/vimwiki",
    #    init = function()
    #        vim.g.vimwiki_list = {
    #            {
    #                path = '~/Documents/wiki/Research',
    #                syntax = 'default',
    #    			listsyms = '✗○◐●✓',
    #                ext = '.wiki',
    #            },
    #        }
    #    end,
    #  },


    #  # Vim Plugins
    #  'mattn/calendar-vim',
    #  'psliwka/vim-smoothie',
    #  'junegunn/limelight.vim',
    #  'itchyny/lightline.vim',
    #  'puremourning/vimspector',
    #  'https://github.com/kshenoy/vim-signature',
    #  {
    #    'junegunn/fzf',
    #    build = function()
    #      vim.fn['fzf#install']()
    #    end
    #   },

    #  {
    #    'startup-nvim/startup.nvim',
    #    dependencies = {'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim'},
    #    config = function()
    #      require'startup'.setup()
    #    end
    #  },
    #
    #  # UltiSnips
    #  'jdujava/telescope-ultisnips.nvim',
    #  # I've been trying to make my vim ultisnips work with nvim. Another snippets are in the folder: 
    #  #/home/vasilii/.local/share/nvim/site/pack/packer/start/vim-snippets/UltiSnips/tex.snippets:148
    #  'SirVer/ultisnips',
    #  'honza/vim-snippets',
    #
    #]

  };

}
