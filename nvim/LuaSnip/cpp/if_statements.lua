local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local vs = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  vs({
    trig = "ifv",
    regTrig = false,
    snippetType = "autosnippet"
  }, fmta([[
    if (<>) {
        <>
    }
  ]], {
    i(1, "condition"),
    d(2, get_visual),
  })),

  -- Specific rank == 0 condition
  vs({
    trig = "ifr",
    regTrig = false,
    snippetType = "autosnippet"
  }, fmta([[
    if (rank == 0) {
       <>
    }
  ]], {
    d(1, get_visual),
  })),
}
