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
}
