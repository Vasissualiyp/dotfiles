local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node

-- Function to handle the replacement for different environments
local function replace_with_env(env, snip)
  local captured_text = snip.captures[1]
  return "\\" .. env .. "{" .. captured_text .. "}"
end

return {
  -- Vector postfix
  s({ trig = "(\\?\\w+)", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    f(function(_, snip)
      return "\\vec{" .. snip.captures[1] .. "}"
    end, {}),
    { condition = function(line_to_cursor)
        return line_to_cursor:match("%w+%.,$")
      end }
  ),
}
