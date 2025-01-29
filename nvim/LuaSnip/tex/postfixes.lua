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


local function create_postfix_snippet(postfix, command)
    -- Escape special regex characters
    local escaped_postfix = postfix:gsub("[][^$()%.*+?|-]", "%%%0")
    
    return s({
        trig = string.format("([a-zA-Z0-9%%_\\^\\{\\}\\\\]+)%s()", escaped_postfix),
        regTrig = true,
        wordTrig = false,
        snippetType = "autosnippet"
    }, {
        c(1, {
            -- Option 1: Formatted command
            f(function(_, snip)
                return string.format("\\%s{%s}", command, snip.captures[1])
            end),
            -- Option 2: Original text with postfix
            f(function(_, snip)
                return snip.captures[1] .. postfix
            end)
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
