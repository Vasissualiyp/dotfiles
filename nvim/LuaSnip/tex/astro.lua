local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
ls.config.setup({enable_autosnippets = true})
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local tsutils = require "config.tsutils"
local function not_in_mathzone()
  return not tsutils.in_mathzone()
end


return {
  as( { trig = "$\\mu$P" }, { t("$\\mathcal{P}$") }, {condition = not_in_mathzone }),
  as( { trig = "\\muP" }, { t("\\mathcal{P}") }, {condition = tsutils.in_mathzone }),
  as({trig = "Msun"}, {t("M_\\odot")}, { condition = tsutils.in_mathzone }),

}
