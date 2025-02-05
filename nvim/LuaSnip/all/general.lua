local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
ls.config.setup({enable_autosnippets = true})
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

return {

  -- Acronyms
  s({trig = "pp" },  { t("PeakPatch") }),
  s({trig = "mus"},  { t("MUSIC") }),
  s({trig = "ps" },  { t("power spectrum") }),
  s({trig = "tf" },  { t("transfer function") }),
  s({trig = "sf"}, { t("star formation") }),

  -- Frequent typos
  as({trig = "teh"}, { t("the") }),

  -- Capitalization
  as({trig = "jwst"}, { t("JWST") }),
  as({trig = "2d"}, { t("2D") }),
  as({trig = "3d"}, { t("3D") }),
}
