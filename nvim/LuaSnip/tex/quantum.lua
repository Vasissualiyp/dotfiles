local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local tsutils = require "config.tsutils"

local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local function not_in_mathzone()
  return not tsutils.in_mathzone()
end

-- Function to replace 'q' with '\\psi' and 'f' with '\\phi'
local function replace_qf(text)
  return text:gsub('q', '\\psi'):gsub('f', '\\phi')
end

return {
  -- Bra snippet
  s({ trig = "<(.-)|", regTrig = true, wordTrig = false , snippetType = "autosnippet"},
    f(function(_, snip)
      return "\\bra{" .. replace_qf(snip.captures[1]) .. "}"
    end),
	{ condition = tsutils.in_mathzone }
  ),
  
  -- Ket snippet
  s({ trig = "|(.-)>", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    f(function(_, snip)
      return "\\ket{" .. replace_qf(snip.captures[1]) .. "}"
    end),
	{ condition = tsutils.in_mathzone }
  ),
  
  -- Braket snippet
  s({ trig = "(.*)\\bra{(.-)}([^|]*)>", regTrig = true, wordTrig = false , snippetType = "autosnippet"},
    f(function(_, snip)
      return snip.captures[1] .. "\\braket{" .. snip.captures[2] .. "}{" ..
             replace_qf(snip.captures[3]) .. "}"
    end),
	{ condition = tsutils.in_mathzone }
  ),

  -- All ways to type hbar
  as("hb", { t("\\hbar") }, { condition = tsutils.in_mathzone }),
  as("-h-", { t("\\hbar") }, { condition = tsutils.in_mathzone }),
  as("hbar", { t("\\hbar") }, { condition = tsutils.in_mathzone }),
}
