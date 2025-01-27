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

local function get_ordinal_suffix(num)
  local last_two = num % 100
  local last_digit = num % 10
  
  if last_two >= 11 and last_two <= 13 then
    return "th"
  end
  
  -- Use 1-based indexing for Lua tables
  local suffixes = { "th", "st", "nd", "rd" }
  return suffixes[last_digit + 1] or "th"  -- +1 to account for 1-based indexing
end

local function ordinal_condition(_, _, captures)
  if not captures or #captures < 2 then return false end
  local num_str = captures[1]
  local input_suffix = captures[2]:lower()
  local num = tonumber(num_str)
  
  if not num then return false end
  if not_in_mathzone() then
    local correct_suffix = get_ordinal_suffix(num)
    return input_suffix == correct_suffix
  end
  return false
end

return {
  s({ trig = "bf" }, { t("\\textbf{"), i(1), t("}"), i(0) }, { condition = not_in_mathzone }),
  s({ trig = "it" }, { t("\\textit{"), i(1), t("}"), i(0) }, { condition = not_in_mathzone }),
  s({ trig = "ul" }, { t("\\ul{"), i(1), t("}"), i(0) }, { condition = not_in_mathzone }),

  as({
    trig = "(%d+)-?([a-zA-Z][a-zA-Z])",
    regTrig = true,
    condition = ordinal_condition
  }, {
    f(function(_, snip)
      local num = tonumber(snip.captures[1])
      local suffix = get_ordinal_suffix(num)
      return num .. "$^{\\text{" .. suffix .. "}}$"
    end)
  })
}
