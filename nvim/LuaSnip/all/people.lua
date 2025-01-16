
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
ls.config.setup({enable_autosnippets = true})
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

return {
  -- Me
  s({trig = "phone"}, { t("4379877525") }),
  s({trig = "name"}, { t("Vasilii Pustovoit") }),
  s({trig = "sid", descr = "student id"}, { t("1004597135") }),
  s({trig = "addr"}, { t("181 Carlton St., Toronto, ON M5A 2K7") }),

  -- Ev
  s({trig = "evphone"}, { t("6479794187") }),
  s({trig = "wxname"}, { t("Wenxuan  Li") }),
  s({trig = "evname"}, { t("Evelyn  Li") }),
  s({trig = "evaddr"}, { t("181 Dundas St E, Toronto, ON M5A 0N5") }),

  -- Dad
  s({trig = "dadphone"}, { t("4379897525") }),
  s({trig = "dadname"}, { t("Yury Pustovoit") }),
  s({trig = "dadaddr"}, { t("3 Wandering Way, Whitby, ON L1R 0R3") }),
}
