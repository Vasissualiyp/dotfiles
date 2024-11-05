local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
ls.config.setup({enable_autosnippets = true})
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

return {
    s({trig = "eval"}, {
		t("$(eval "),
		i(1, "VAR_NAME"),
		t(" := $(shell "),
		i(2,  "EXPRESSION"),
		t(" ))")
    }),
    s({trig = "evalbc"}, {
		t("$(eval "),
		i(1, "VAR_NAME"),
		t(" := $(shell "),
		i(2,  "EXPRESSION"),
		t(" | bc -l))")
    }),
}
