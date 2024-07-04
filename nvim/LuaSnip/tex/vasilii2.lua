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
  -- Vector postfix

  s({ trig = "(.-);v", regTrig = true, wordTrig = false , snippetType = "autosnippet"},
    f(function(_, snip)
      return "\\Vec{" .. replace_qf(snip.captures[1]) .. "}"
    end),
	{ condition = tsutils.in_mathzone }
  ),

  s(
    { trig = "(\\?\\w+)\\.,", regTrig = true, wordTrig = false },
    f(function(_, snip)
      return "\\vec{" .. snip.captures[1] .. "}"
    end, {})
  ),

  -- Angled brackets postfix
  s(
    { trig = "(\\?\\w+)%.a", regTrig = true, wordTrig = false },
    f(function(_, snip)
      return "\\left< " .. snip.captures[1] .. " \\right>"
    end, {})
  ),

  -- Harpoons postfix
  s(
    { trig = "(\\?\\w+)%.H", regTrig = true, wordTrig = false },
    f(function(_, snip)
      return "\\lrharpoon{" .. snip.captures[1] .. "}"
    end, {})
  ),

  -- Hat postfix
  s(
    { trig = "(\\?\\w+)%.h", regTrig = true, wordTrig = false },
    f(function(_, snip)
      return "\\hat{" .. snip.captures[1] .. "}"
    end, {})
  ),

  -- Tilde postfix
  s(
    { trig = "(\\?\\w+)%.t", regTrig = true, wordTrig = false },
    f(function(_, snip)
      return "\\tilde{" .. snip.captures[1] .. "}"
    end, {})
  ),

  -- Bar postfix
  s(
    { trig = "(\\?\\w+)%.b", regTrig = true, wordTrig = false },
    f(function(_, snip)
      return "\\bar{" .. snip.captures[1] .. "}"
    end, {})
  ),
}
