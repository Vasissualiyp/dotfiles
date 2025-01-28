local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
ls.config.setup({enable_autosnippets = true})
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

return {

  -- Get current path
  as({trig = "pwd"}, {
    f(function()
      return vim.fn.getcwd()
    end),
  }),
}
