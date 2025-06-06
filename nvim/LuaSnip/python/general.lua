local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

return {
  as({trig = "#!", regTrig = true, name = "Shebang", dscr = "Interpreter directive to execute file with Python", snippetType = "autosnippet"}, 
    fmt("#!/usr/bin/env python{}", 
      c(1, {
        t(""),
        t("3")
      })
    )
  ),

  s({trig = "logger", name = "Global Logger", dscr = "A globally scoped module-level logger"},
    fmt("logger: logging.Logger = logging.getLogger({})\n{}", 
      {
        i(1, "__name__"),
        c(2, {
          t("logger.addHandler(logging.NullHandler())"),
          t("")
        })
      }
    )
  ),

  s({trig = "lm", name = "Log Message (Choice)", dscr = "Log a new message to the global logger"},
    fmt("logger.{}({})", 
      {
        c(1, {
          t("debug"),
          t("info"),
          t("warning"),
          t("error"),
          t("critical"),
          t("exception")
        }),
        i(2, "\"message\"")
      }
    )
  ),

  s({trig = "main", name = "Run only when executing .py", dscr = "Set __name__ variable to __main__"},
    {
      t({'if __name__ == "__main__":', "    "}),
      i(1, "# Your code here")
    }
  ),


  s({trig = "dcl", name = "Dataclass Definition", dscr = "Define a new dataclass"},
    fmt("@dataclass{}\nclass {}{}:\n\t\"\"\"{}\"\"\"\n\t{}",
      {
        c(1, {
          sn(nil, {
            t("("),
            i(1, "Options"),
            t(")")
          }),
          t("")
        }),
        i(2, "ClassName"),
        c(3, {
          sn(nil, {
            t("("),
            i(1, "ParentClass"),
            t(")")
          }),
          t("")
        }),
        i(4, "DocString"),
        i(5, "Attributes")
      }
    )
  ),

  as({trig = "printf"}, { t("print(f\""), i(1, "statement"), t("\")") }),
  as({trig = "raisev"}, { t("raise ValueError(f\""), i(1, "statement"), t("\")") }),

  -- Python function snippet with docstring and return statement
  as({trig = "deff", name = "Function Definition", dscr = "Function definition with docstring"}, {
      t("def "), i(1, "function_name"), t("("), i(2, "parameters"), t({"):", "    "}),
      i(0, "pass"),  -- Final placeholder, defaults to `pass`
  }),
  --as({trig = "deff", name = "Function Definition", dscr = "Function definition with docstring"},
  --  fmt("def {}({}) -> {}:\n\t\"\"\"{}\"\"\"\n\t{}", 
  --    {
  --      i(1, "function_name"),
  --      i(2, "Parameters"),
  --      i(3, "None"),
  --      i(4, "DocString"),
  --      i(5, "pass")
  --    }
  --  )
  --),

  as({trig = "defc", name = "Class Definition", dscr = "Define a new class"},
    fmt("class {}{}:\n\tdef __init__(self{}):\n\t\t\"\"\"{}\"\"\"\n\t\t{}", 
      {
        i(1, "ClassName"),
        c(2, {
          sn(nil, {
            t("("),
            i(1, "ParentClass"),
            t(")")
          }),
          t("")
        }),
        c(3, {
          sn(nil, {
            t(", "),
            i(1, "Parameters")
          }),
          t("")
        }),
        i(5, "Create a new instance"),
        i(6, "pass")
      }
    )
  ),


  s({trig = "defm", name = "Method Definition", dscr = "Method definition with docstring"},
    fmt("def {}(self, {}) -> {}:\n\t\"\"\"{}\"\"\"\n\t{}", 
      {
        i(1, "function_name"),
        i(2, "Parameters"),
        i(3, "None"),
        i(4, "DocString"),
        i(5, "pass")
      }
    )
  ),

  s({trig = "@property", name = "Class Property Decorator", dscr = "Define a property for a Class"},
    fmt("@property\ndef {}(self) -> {}:\n\t\"\"\"Return the {} property.\"\"\"\n\treturn self._{}\n@{}.setter\ndef {}(self, value: {}) -> None:\n\t\"\"\"Set the {} property.\"\"\"\n\tself._{} = value", 
      {
        i(1, "PropertyName"),
        i(2, "Type"),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(2),
        rep(1),
        rep(1)
      }
    )
  ),

  s({trig = "with", name = "Context Manager", dscr = "Use a context manager to access a resource"},
    fmt("with {} as {}:\n\t{}", 
      {
        i(1, "expression"),
        i(2, "variable"),
        i(3, "pass")
      }
    )
  ),

  s({trig = "try", name = "Try/Except", dscr = "Try to perform an action; catch and handle exceptions"},
    fmt("try:\n\t{}\nexcept {} as {}:\n\t{}", 
      {
        i(1, "expression"),
        i(2, "Exception"),
        i(3, "error"),
        i(4, "pass")
      }
    )
  ),

  s({trig = "al", name = "Assert Logs", dscr = "Create a context manager to assert that a particular message is logged"},
    fmt("with self.assertLogs(\"{}\", {}) as cm:\n\t{}", 
      {
        i(1, "logger.name"),
        c(2, {
          t("logging.DEBUG"),
          t("logging.INFO"),
          t("logging.WARNING"),
          t("logging.ERROR"),
          t("logging.CRITICAL"),
          t("logging.EXCEPTION")
        }),
        i(3, "pass")
      }
    )
  ),
  as({trig = "docstr", name = "DocString", dscr = "Edit docstring"},
    fmt("\"\"\"{}\"\"\"\n\t", 
      {
        i(1, "DocString"),
      }
    )
  ),

  s({trig = "ar", name = "Assert Raises", dscr = "Create a context manager to assert that a particular Exception is raised"},
    fmt("with self.assertRaises({}):\n\t{}", 
      {
        i(1, "Exception"),
        i(2, "pass")
      }
    )
  ),
}
