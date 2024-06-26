local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Integral snippets with priority 300 and snippetType "autosnippet"
  s({trig = "dint", priority = 300, snippetType = "autosnippet"}, 
    {t("\\int "), i(1, "${VISUAL}"), t(" \\, \\mathrm{d} "), i(2, "x"), t(" "), i(0)}
  ),
  s({trig = "cint", priority = 300, snippetType = "autosnippet"}, 
    {t("\\oint\\limits_{"), i(1, "\\Gamma"), t("} "), i(2, "${VISUAL}"), t(" \\, \\mathrm{d} "), i(3, "\\gamma"), t(" "), i(0)}
  ),
  s({trig = "ddint", priority = 300, snippetType = "autosnippet"}, 
    {t("\\int_{"), i(1, "-\\infty"), t("}^{"), i(2, "\\infty"), t("} "), i(3, "${VISUAL}"), t(" \\, \\mathrm{d} "), i(4, "x"), t(" "), i(0)}
  ),
}
