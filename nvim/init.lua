--[[---------------------------------------------------------------------------------------------------------------------------

 /$$    /$$                     /$$                                         /$$ /$$                                    
| $$   | $$                    |__/                                        | $$|__/                                    
| $$   | $$  /$$$$$$   /$$$$$$$ /$$  /$$$$$$$  /$$$$$$$ /$$   /$$  /$$$$$$ | $$ /$$ /$$   /$$  /$$$$$$                 
|  $$ / $$/ |____  $$ /$$_____/| $$ /$$_____/ /$$_____/| $$  | $$ |____  $$| $$| $$| $$  | $$ /$$__  $$                
 \  $$ $$/   /$$$$$$$|  $$$$$$ | $$|  $$$$$$ |  $$$$$$ | $$  | $$  /$$$$$$$| $$| $$| $$  | $$| $$  \ $$                
  \  $$$/   /$$__  $$ \____  $$| $$ \____  $$ \____  $$| $$  | $$ /$$__  $$| $$| $$| $$  | $$| $$  | $$                
   \  $/   |  $$$$$$$ /$$$$$$$/| $$ /$$$$$$$/ /$$$$$$$/|  $$$$$$/|  $$$$$$$| $$| $$|  $$$$$$$| $$$$$$$/                
    \_/     \_______/|_______/ |__/|_______/ |_______/  \______/  \_______/|__/|__/ \____  $$| $$____/                 
                                                                                    /$$  | $$| $$                      
                                                                                   |  $$$$$$/| $$                      
                                                                                    \______/ |__/                      
 /$$   /$$                                /$$                      /$$$$$$                       /$$$$$$  /$$          
| $$$ | $$                               |__/                     /$$__  $$                     /$$__  $$|__/          
| $$$$| $$  /$$$$$$   /$$$$$$  /$$    /$$ /$$ /$$$$$$/$$$$       | $$  \__/  /$$$$$$  /$$$$$$$ | $$  \__/ /$$  /$$$$$$ 
| $$ $$ $$ /$$__  $$ /$$__  $$|  $$  /$$/| $$| $$_  $$_  $$      | $$       /$$__  $$| $$__  $$| $$$$    | $$ /$$__  $$
| $$  $$$$| $$$$$$$$| $$  \ $$ \  $$/$$/ | $$| $$ \ $$ \ $$      | $$      | $$  \ $$| $$  \ $$| $$_/    | $$| $$  \ $$
| $$\  $$$| $$_____/| $$  | $$  \  $$$/  | $$| $$ | $$ | $$      | $$    $$| $$  | $$| $$  | $$| $$      | $$| $$  | $$
| $$ \  $$|  $$$$$$$|  $$$$$$/   \  $/   | $$| $$ | $$ | $$      |  $$$$$$/|  $$$$$$/| $$  | $$| $$      | $$|  $$$$$$$
|__/  \__/ \_______/ \______/     \_/    |__/|__/ |__/ |__/       \______/  \______/ |__/  |__/|__/      |__/ \____  $$
                                                                                                              /$$  \ $$
                                                                                                             |  $$$$$$/
                                                                                                              \______/ 
------------------------------------------------------------------------------------------------------------------------------
    
    Configuration created by Vasissualiyp
    Neovim version: 0.5+ required

    Contents:
    - Plugin management
    - Key mappings
    - UI Enhancements
    - Performance tweaks
    - Language-specific settings
    - Utility functions and commands

    Note: This configuration is tailored to my workflow
          and development environment. Adjustments may be needed
          to fit your personal preferences and setup.

------------------------------------------------------------------------------------------------------------------------------

]]--
-- Fix lua embedded highlighting: in `sudo nvim` do:
-- :!curl -sS https://raw.githubusercontent.com/neovim/neovim/v0.7.2/runtime/syntax/lua.vim > $VIMRUNTIME/syntax/lua.vim
-- Don't forget to `pip install pynvim`

-- This would install VimPlug - not needed for this lua-based configuration with lazy.nvim
--vim.cmd('source ~/.config/nvim/vimscript/installplug.vim')

require('config.global_parameters')

-- This is needed to setup the path, which is essential for nvim on NixOS to work
require('config.path_setup')

vim.g.vimtex_syntax_enabled = 0

-- Load config settings
require('keymaps.global')
require('config.colors')
require('config.digraphs')

-- Import plugins
require('config.plugins')

---------------------------
-------PLUGINS - VIM-------
---------------------------
-- Vimtex --
vim.cmd('source ~/.config/nvim/vimscript/vimtex.vim')
require('plugins.vimtex')
-- SimPylFold --
require('plugins.simpylfold')
-- Limelight -- Currently not working 
--require('plugins.limelight')
--require('keymaps.limelight')
-- Vim-Smoothie --
require('plugins.smoothie')
-- Inkscape (Gilles Catelle's snippets) --
require('keymaps.inkscape')
-- Vimwiki --
require('plugins.vimwiki')
-- Calendar --
require('plugins.calendar')
-- Lightline --
require('plugins.lightline')
-- CMP (Completion --
require('plugins.cmp')
------------------------------
-------PLUGINS - NEOVIM-------
------------------------------
-- Noterius --
require('keymaps.noterius')
vim.cmd('source ~/.config/nvim/vimscript/noterius.vim')
-- Treesitter --
require('plugins.treesitter')
-- Harpoon --
require('plugins.harpoon')
require('keymaps.harpoon')
-- Telescope --
require('plugins.telescope')
require('keymaps.telescope')
-- UltiSnips --
require('keymaps.ultisnips')
-- LSP --
require('lsp.config')
require('lsp.diagnostics')
require('lsp.keymaps')
require('lsp.lua')
require('lsp.bash')
require('lsp.rust')
require('lsp.python')
