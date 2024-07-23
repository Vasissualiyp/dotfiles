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

  s({trig = "logger", name = "Global Logger", dscr = "A globally scoped module-level logger", snippetType = "snippet"},
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

  s({trig = "lm", name = "Log Message (Choice)", dscr = "Log a new message to the global logger", snippetType = "snippet"},
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

  s({trig = "dcl", name = "Dataclass Definition", dscr = "Define a new dataclass", snippetType = "snippet"},
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

  as({trig = "deff", name = "Function Definition", dscr = "Function definition with docstring", snippetType = "snippet"},
    fmt("def {}({}) -> {}:\n\t\"\"\"{}\"\"\"\n\t{}", 
      {
        i(1, "function_name"),
        i(2, "Parameters"),
        i(3, "None"),
        i(4, "DocString"),
        i(5, "pass")
      }
    )
  ),

  as({trig = "defc", name = "Class Definition", dscr = "Define a new class", snippetType = "snippet"},
    fmt("class {}{}:\n\t\"\"\"{}\"\"\"\n\tdef __init__(self{}):\n\t\t\"\"\"{}\"\"\"\n\t\t{}", 
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
        i(3, "DocString"),
        c(4, {
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


  s({trig = "defm", name = "Method Definition", dscr = "Method definition with docstring", snippetType = "snippet"},
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

  s({trig = "@property", name = "Class Property Decorator", dscr = "Define a property for a Class", snippetType = "snippet"},
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

  s({trig = "with", name = "Context Manager", dscr = "Use a context manager to access a resource", snippetType = "snippet"},
    fmt("with {} as {}:\n\t{}", 
      {
        i(1, "expression"),
        i(2, "variable"),
        i(3, "pass")
      }
    )
  ),

  s({trig = "try", name = "Try/Except", dscr = "Try to perform an action; catch and handle exceptions", snippetType = "snippet"},
    fmt("try:\n\t{}\nexcept {} as {}:\n\t{}", 
      {
        i(1, "expression"),
        i(2, "Exception"),
        i(3, "error"),
        i(4, "pass")
      }
    )
  ),

  s({trig = "al", name = "Assert Logs", dscr = "Create a context manager to assert that a particular message is logged", snippetType = "snippet"},
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

  s({trig = "ar", name = "Assert Raises", dscr = "Create a context manager to assert that a particular Exception is raised", snippetType = "snippet"},
    fmt("with self.assertRaises({}):\n\t{}", 
      {
        i(1, "Exception"),
        i(2, "pass")
      }
    )
  ),
}
