-- ######################## --
-- GILLES CASTEL'S SNIPPETS --
-- ######################## --
local ls = require("luasnip")
local s = ls.snippet
ls.config.setup({enable_autosnippets = true})

return {
s({trig="beg", snippetType="autosnippet"},
  fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
    ]],
    {
      i(1),
      i(2),
      rep(1),  -- this node repeats insert node i(1)
    }
  )
),
}
-- snippet mk "Math" wA
-- $ ${1}$`!p
-- if t[2] and t[2][0] not in [',', '.', '?', '-', ' ']:
--     snip.rv = ' '
-- else:
--     snip.rv = ''
-- `$2
-- endsnippet
-- 
-- snippet tt "text" w
-- \text{$1} $0
-- endsnippet
-- 
-- #snippet '([A-Za-z])(\d)' "auto subscript" wrA
-- #`!p snip.rv = match.group(1)`_`!p snip.rv = match.group(2)`
-- #endsnippet
-- #
-- #snippet '([A-Za-z])_(\d\d)' "auto subscript2" wrA
-- #`!p snip.rv = match.group(1)`_{`!p snip.rv = match.group(2)`}
-- #endsnippet
-- 
-- 
-- snippet '((\d+)|(\d*)(\\)?([A-Za-z]+)((\^|_)(\{\d+\}|\d))*)/' "Fraction" wr
-- \\frac{`!p snip.rv = match.group(1)`}{$1}$0
-- endsnippet
-- 
-- snippet inf "infinity" w
-- \infty
-- endsnippet
-- 
-- snippet // "Fraction" iA
-- \\frac{$1}{$2}$0
-- endsnippet
-- 
