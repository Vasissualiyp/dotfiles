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
      { i(1, "iostream") }
    )
  ),

  s({trig = "cout", name = "Cout", dscr = "Cout statement"}, 
    fmt('std::cout << {} << std::endl;', 
      { i(1, "message") }
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

  s({trig = "class", name = "Class Definition", dscr = "Define a class"}, 
    fmt([[
    class {} {{
    public:
      {}
    private:
      {}
    }};
    ]], 
      { i(1, "ClassName"), i(2, "// public members"), i(3, "// private members") }
    )
  ),

  s({trig = "template", name = "Template", dscr = "Template definition"}, 
    fmt([[
    template<typename {}>{}
    ]], 
      { i(1, "T"), i(2, "// template code") }
    )
  ),
}
