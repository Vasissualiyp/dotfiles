local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
ls.config.setup({enable_autosnippets = true})

return {
  s({trig="url", dscr="The hyperref package's href{}{} command (for url links)"},
    fmta(
      [[\href{<>}{<>}]],
      {
        i(1, "url"),
        i(2, "display name"),
      }
    )
  ),
}
