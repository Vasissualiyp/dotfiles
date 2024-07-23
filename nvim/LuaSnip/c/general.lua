local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s({trig = "main", name = "Main Function", dscr = "Main function template"}, 
    fmt([[
    int main(int argc, char *argv[]) {{
      {}
      return 0;
    }}
    ]], 
      { i(1, "// code") }
    )
  ),

  s({trig = "include", name = "Include Header", dscr = "Include a header file"}, 
    fmt('#include <{}>', 
      { i(1, "stdio.h") }
    )
  ),

  s({trig = "printf", name = "Printf", dscr = "Printf function"}, 
    fmt('printf("{}\\n", {});', 
      { i(1, "message"), i(2, "variable") }
    )
  ),

  s({trig = "for", name = "For Loop", dscr = "For loop"}, 
    fmt([[
    for (int {} = 0; {} < {}; ++{}) {{
      {}
    }}
    ]], 
      { i(1, "i"), rep(1), i(2, "n"), rep(1), i(3, "// code") }
    )
  ),

  s({trig = "if", name = "If Statement", dscr = "If statement"}, 
    fmt([[
    if ({}) {{
      {}
    }}
    ]], 
      { i(1, "condition"), i(2, "// code") }
    )
  ),

  s({trig = "while", name = "While Loop", dscr = "While loop"}, 
    fmt([[
    while ({}) {{
      {}
    }}
    ]], 
      { i(1, "condition"), i(2, "// code") }
    )
  ),

  s({trig = "struct", name = "Struct Definition", dscr = "Define a struct"}, 
    fmt([[
    struct {} {{
      {}
    }};
    ]], 
      { i(1, "name"), i(2, "// members") }
    )
  ),

  s({trig = "typedef", name = "Typedef", dscr = "Typedef for a struct"}, 
    fmt([[
    typedef struct {} {} {};
    ]], 
      { i(1, "name"), i(2, "alias"), i(3, "// members") }
    )
  ),
}
