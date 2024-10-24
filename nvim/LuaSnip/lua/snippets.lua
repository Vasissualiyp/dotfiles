local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
ls.config.setup({enable_autosnippets = true})
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })


return {
  s({trig = "header"}, {
    t({
      "local ls = require(\"luasnip\")",
      "local s = ls.snippet",
      "local i = ls.insert_node",
      "local t = ls.text_node",
      "ls.config.setup({enable_autosnippets = true})",
      "local as = ls.extend_decorator.apply(s, { snippetType = \"autosnippet\" })",
      "",
      "return {",
      ""
    }),
    i(1, "-- put snippets here --"),
    t({"", "}"})
  }),

  s({trig = "s"}, {
    t("s({trig = \""), i(1, "trigger"), t("\"}, { "),
    t("t(\""), i(2, "text"), t("\")"),
    t(" }),")
  }),

  s({trig = "as"}, {
    t("as({trig = \""), i(1, "trigger"), t("\"}, { "),
    t("t(\""), i(2, "text"), t("\")"),
    t(" }),")
  })
}
