local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

return {
  as({trig = "flake_init", name = "Nix Flake Template", dscr = "Nix flake template"},
    fmt([[
    {{
      description = "{}";

      inputs = {{
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
      }};

      outputs = {{ self, nixpkgs, flake-utils }}:
        flake-utils.lib.eachDefaultSystem (system:
          let
            pkgs = import nixpkgs {{
              inherit system;
              config = {{
                allowUnfree = true;
              }};
            }};
          in
          {{
            devShell = pkgs.mkShell {{
              buildInputs = with pkgs; [
                hello
              ];
            }};
          }}
        );
    }}
    ]], 
      { i(1, "name") }
    )
  ),

  s({trig = "import", name = "Import", dscr = "Import a Nix expression"},
    fmt('import {}', 
      { i(1, "<nixpkgs>") }
    )
  ),

  s({trig = "pkgs", name = "Packages", dscr = "Import nixpkgs"},
    fmt('let pkgs = import {} {{}};', 
      { i(1, "<nixpkgs>") }
    )
  ),

  s({trig = "mkDerivation", name = "Package Derivation", dscr = "Define a package derivation"},
    fmt([[
    pkgs.stdenv.mkDerivation {{
      name = "{}";
      src = {};
      buildInputs = [ {} ];
      {}
    }}
    ]], 
      { i(1, "package-name"), i(2, "source"), i(3, "inputs"), i(4, "buildPhase") }
    )
  ),

  s({trig = "mkShell", name = "Development Shell", dscr = "Define a development shell"},
    fmt([[
    pkgs.mkShell {{
      buildInputs = with pkgs; [
        {}
      ];
    }}
    ]], 
      { i(1, "hello") }
    )
  ),

  s({trig = "let", name = "Let Expression", dscr = "Let expression"},
    fmt([[
    let
      {} = {};
    in
      {}
    ]], 
      { i(1, "name"), i(2, "value"), i(3, "expression") }
    )
  ),

  s({trig = "with", name = "With Expression", dscr = "With expression"},
    fmt([[
    with {};
    {}
    ]], 
      { i(1, "pkgs"), i(2, "expression") }
    )
  ),

  s({trig = "rec", name = "Rec Expression", dscr = "Recursive attribute set"},
    fmt([[
    rec {{
      {}
    }}
    ]], 
      { i(1, "attributes") }
    )
  ),

  s({trig = "function", name = "Function", dscr = "Define a function"},
    fmt([[
    {}: {}
    ]], 
      { i(1, "arg"), i(2, "expression") }
    )
  ),
}
