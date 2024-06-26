local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node

return {
  -- Vector postfix
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
