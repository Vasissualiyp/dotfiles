local ls = require("luasnip")
local s = ls.snippet
local c = ls.choice_node
local f = ls.function_node
local i = ls.insert_node
local tsutils = require("config.tsutils")

local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local function not_in_mathzone()
  return not tsutils.in_mathzone()
end


local function create_parenthetical_postfix_snippet(postfix, command)
    local escaped_postfix = postfix:gsub("[][^$()%.*+?|-]", "%%%0")
    
    return s({
        trig = string.format("%%b()%s()", escaped_postfix),
        regTrig = true,
        wordTrig = false,
        snippetType = "autosnippet"
    }, {
        c(1, {
            -- Formatted version with parentheses removal
            sn(nil, {
                f(function(_, snip)
                    local content = snip.captures[1]:sub(2, -2)  -- Remove ()
                    return string.format("\\%s{%s}", command, content)
                end),
                i(0)
            }),
            -- Original version
            sn(nil, {
                f(function(_, snip)
                    return snip.captures[1] .. postfix
                end),
                i(0)
            })
        })
    }, { 
        condition = tsutils.in_mathzone 
    })
end



return {
  create_postfix_snippet(".v", "Vec"),
  create_postfix_snippet(".h", "hat"),
  create_postfix_snippet(".H", "lrharpoon"),
  create_postfix_snippet(".t", "tilde"),
  create_postfix_snippet(".b", "bar"),

  -- Angled brackets postfix
  s({
      trig = "([^%s]+)%.a",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
  }, 
      f(function(_, snip)
        return "\\left< " .. snip.captures[1] .. " \\right>"
      end),
      { condition = tsutils.in_mathzone }
  ),
}
