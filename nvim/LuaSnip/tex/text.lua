local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local tsutils = require "config.tsutils"

local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local function not_in_mathzone()
  return not tsutils.in_mathzone()
end

return {

  s({trig = "bf"}, {t("\\textbf{"), i(1), t("}"), i(0)}, {condition = not_in_mathzone }),
  s({trig = "it"}, {t("\\textit{"), i(1), t("}"), i(0)}, {condition = not_in_mathzone }),
  s({trig = "ul"}, {t("\\ul{"), i(1), t("}"), i(0)}, {condition = not_in_mathzone }),
}
