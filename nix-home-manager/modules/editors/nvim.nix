{ ... }:

let

in

{
  programs.neovim = {
    enable = true;

	extraLuaConfig = ''
      ${builtins.readFile ../nvim/lua/config/global_parameters.lua  }
      
      -- This is needed to setup the path, which is essential for nvim on NixOS to work
      ${builtins.readFile ../nvim/lua/config/path_setup.lua}
      
      -- Load config settings
      ${builtins.readFile ../nvim/lua/keymaps/global.lua}
      ${builtins.readFile ../nvim/lua/config/colors.lua}
      ${builtins.readFile ../nvim/lua/config/digraphs.lua}

	'';

  };
}
