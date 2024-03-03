{ ... }:

let

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

	'';

  };
}
