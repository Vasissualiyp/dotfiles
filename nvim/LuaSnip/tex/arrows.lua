local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local tsutils = require "config.tsutils"

local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local function not_in_mathzone()
  return not tsutils.in_mathzone()
end

return {
  as({ trig = "->"}, t  "\\rightarrow", { condition = tsutils.in_mathzone }),
  as({ trig = "->"}, t "$\\rightarrow$", { condition = not_in_mathzone }),

  as({ trig = "==>"}, t  "\\implies", { condition = tsutils.in_mathzone }),
  as({ trig = "==>"}, t "$\\implies$", { condition = not_in_mathzone }),

  as({ trig = "=>"}, t  "\\Rightarrow", { condition = tsutils.in_mathzone }),
  as({ trig = "=>"}, t "$\\Rightarrow$", { condition = not_in_mathzone }),

  as({ trig = "<-"}, t  "\\leftarrow", { condition = tsutils.in_mathzone }),
  as({ trig = "<-"}, t "$\\leftarrow$", { condition = not_in_mathzone }),

  as({ trig = "<="}, t  "\\Leftarrow", { condition = tsutils.in_mathzone }),
  as({ trig = "<="}, t "$\\Leftarrow$", { condition = not_in_mathzone }),

  as({ trig = "\\leftarrow>"}, t  "\\leftrightarrow", { condition = tsutils.in_mathzone }),
  as({ trig = "$\\leftarrow$>"}, t "$\\leftrightarrow$", { condition = not_in_mathzone }),

  as({ trig = "\\leftarrow-"}, t  "\\longleftarrow", { condition = tsutils.in_mathzone }),
  as({ trig = "$\\leftarrow$-"}, t "$\\longleftarrow$", { condition = not_in_mathzone }),

  as({ trig = "\\longleftarrow>"}, t  "\\longleftrightarrow", { condition = tsutils.in_mathzone }),
  as({ trig = "$\\longleftarrow$>"}, t "$\\longleftrightarrow$", { condition = not_in_mathzone }),

  as({ trig = "\\Leftarrow="}, t  "\\impliedby", { condition = tsutils.in_mathzone }),
  as({ trig = "$\\Leftarrow$="}, t "$\\impliedby$", { condition = not_in_mathzone }),

  as({ trig = "\\Leftarrow>"}, t  "\\iff", { condition = tsutils.in_mathzone }),
  as({ trig = "$\\Leftarrow$>"}, t  "$\\iff$", { condition = not_in_mathzone }),

  as({ trig = "\\impliedby>"}, t  "\\Longleftrightarrow", { condition = tsutils.in_mathzone }),
  as({ trig = "$\\impliedby$>"}, t  "$\\Longleftrightarrow$", { condition = not_in_mathzone }),
}
