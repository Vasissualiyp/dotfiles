local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node
local tsutils = require "config.tsutils"

local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local function not_in_mathzone()
  return not tsutils.in_mathzone()
end

return {

  s({trig = "bf"}, {t("\\textbf{"), i(1), t("}"), i(0)}, {condition = not_in_mathzone }),
  s({trig = "it"}, {t("\\textit{"), i(1), t("}"), i(0)}, {condition = not_in_mathzone }),
  s({trig = "ul"}, {t("\\ul{"), i(1), t("}"), i(0)}, {condition = not_in_mathzone }),
  as({ trig = "(%d+)-(%a%a)", regTrig = true }, {
    f(function(_, snip)
      local num = tonumber(snip.captures[1])
      local suffix = snip.captures[2]:lower()

      -- Determine the correct ordinal suffix
      local last_two = num % 100
      local last_digit = num % 10
      local ord_suffix

      if last_two >= 11 and last_two <= 13 then
        ord_suffix = "th"
      else
        if last_digit == 1 then
          ord_suffix = "st"
        elseif last_digit == 2 then
          ord_suffix = "nd"
        elseif last_digit == 3 then
          ord_suffix = "rd"
        else
          ord_suffix = "th"
        end
      end

      return num .. "$^{\\text{" .. ord_suffix .. "}}$"
    end)
  })
}
