local ls = require("luasnip")  -- Load LuaSnip
local s = ls.snippet
local t = ls.text_node
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

-- Create a snippet available for all file types
ls.add_snippets("all", {  -- 'all' makes it available for every filetype
  as({trig = "Doga"}, {t("Doğa")}),
  as({trig = "Grudic"}, {t("Grudić")}),
  as({trig = "Schrodinger"}, {t("Schrödinger")})
})
