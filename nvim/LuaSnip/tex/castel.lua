-- ######################## --
-- GILLES CASTEL'S SNIPPETS --
-- ######################## --
local ls = require("luasnip")
local s = ls.snippet
ls.config.setup({enable_autosnippets = true})
local tsutils = require "config.tsutils"

local line_begin = require("luasnip.extras.expand_conditions").line_begin
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local function not_in_mathzone()
  return not tsutils.in_mathzone()
end

-- Function to process the match and construct the fraction
local function process_fraction(args, snip)
  local match = snip.captures[1]
  return "\\frac{" .. match .. "}{"
end

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

  -- Inline math
  as("mm", fmta(
      [[
	    $<>$<>
      ]],
      {
        i(1),
        i(0)
      },
	  { condition = not_in_mathzone }
    )
  ),
  -- Display math
  s("dm", fmta(
      [[
\[
  <>
\]
<>
      ]],
      {
        i(1),
        i(0)
      }
    ),
	{ condition = line_begin }
  ),
  as("//", fmta(
      [[
	    /frac{<>}{<>}<>
      ]],
      {
        i(1),
        i(2),
        i(0)
      }
    ),
	{ condition = tsutils.in_mathzone }
  ),
  as(
    { trig = "%((.-)%)%/", regTrig = true, wordTrig = false },
    {
      f(process_fraction, {}),
      i(1),
      t("}"),
      i(0)
    }
  ),
  as("tt", fmta(
      [[
	    \\text{<>}<>
      ]],
      {
        i(1),
        i(0)
      }
    ),
	{ condition = tsutils.in_mathzone }
  ),
}
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
