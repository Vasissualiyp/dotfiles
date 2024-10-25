local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local i = ls.insert_node
local t = ls.text_node
local tsutils = require "config.tsutils"

local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local function not_in_mathzone()
  return not tsutils.in_mathzone()
end

-- More fonts info:
-- https://tex.stackexchange.com/questions/58098/what-are-all-the-font-styles-i-can-use-in-math-mode

return {

  as({ trig = "\\phic", dscr="mathcal font. Activation: ;fc"}, {
		  t("\\mathcal{"),
		  i(1, "variable"),
		  t("}"),
  }, { condition = tsutils.in_mathzone }),

  as({ trig = "\\phis", dscr="mathscr font. Activation: ;fs. Requires mathrsfs package"}, {
		  t("\\mathscr{"),
		  i(1, "variable"),
		  t("}"),
  }, { condition = tsutils.in_mathzone }),

  as({ trig = "\\phib", dscr="mathscr font. Activation: ;fb. Requires amsfonts/amssymb/txfonts package"}, {
		  t("\\mathbb{"),
		  i(1, "variable"),
		  t("}"),
  }, { condition = tsutils.in_mathzone }),

  as({ trig = "\\phif", dscr="mathfrak font. Activation: ;ff. Requires eufrak package"}, {
		  t("\\mathfrak{"),
		  i(1, "variable"),
		  t("}"),
  }, { condition = tsutils.in_mathzone }),

}
