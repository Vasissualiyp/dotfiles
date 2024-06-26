local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

-- Function to get current time in HH:MM format
local function get_current_time()
  return os.date("%H:%M")
end
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  -- Green note
  s({trig = "gnote", dscr = "Green note", snippetType = "autosnippet"},
    fmta(
      [[
      \note{green}{<> at <>}.
      %{{{{
      <>
      %}}}
      <>
      ]],
      {
        i(1),
        f(function() return get_current_time() end),
        i(2),
        i(0)
      }
    ),
	{ condition = line_begin }
  ),

  -- Blue note
  s({trig = "bnote", dscr = "Blue note", snippetType = "autosnippet"},
    fmta(
      [[
      \note{blue}{<> at <>}.
      %{{{{
      <>
      %}}}
      <>
      ]],
      {
        i(1),
        f(function() return get_current_time() end),
        i(2),
        i(0)
      }
    ),
	{ condition = line_begin }
  ),

  -- Red note
  s({trig = "rnote", dscr = "Red note", snippetType = "autosnippet"},
    fmta(
      [[
      \note{red}{<> at <>}.
      %{{{{
      <>
      %}}}
      <>
      ]],
      {
        i(1),
        f(function() return get_current_time() end),
        i(2),
        i(0)
      }
    ),
	{ condition = line_begin }
  ),

  -- Black note
  s({trig = "knote", dscr = "Black note", snippetType = "autosnippet"},
    fmta(
      [[
      \note{black}{<> at <>}.
      %{{{{
      <>
      %}}}
      <>
      ]],
      {
        i(1),
        f(function() return get_current_time() end),
        i(2),
        i(0)
      }
    ),
	{ condition = line_begin }
  ),

  -- Meeting note
  s({trig = "meet", dscr = "Meeting note", snippetType = "autosnippet"},
    fmta(
      [[
      \note{purple}{{{\large Meeting with <> at <>}}}.
      %{{{{
      <>
      %}}}
      <>
      ]],
      {
        i(1),
        f(function() return get_current_time() end),
        i(2),
        i(0)
      }
    ),
	{ condition = line_begin }
  ),

  -- Idea
  s({trig = "idea", dscr = "Idea", snippetType = "autosnippet"},
    fmta(
      [[
      \note{teal}{<>}.
      %{{{{
      <>
      %}}}
      <>
      ]],
      {
        i(1),
        i(2),
        i(0)
      }
    ),
	{ condition = line_begin }
  ),

  -- Black Board Seminar
  s({trig = "BBsem", dscr = "Black Board Seminar", snippetType = "autosnippet"},
    fmta(
      [[
      \note{olive}{{{\large BB Seminar at <>}}}.
      %{{{{
      <>
      %}}}
      <>
      ]],
      {
        f(function() return get_current_time() end),
        i(1),
        i(0)
      }
    ),
	{ condition = line_begin }
  ),

  -- Seminar
  s({trig = "sem", dscr = "Seminar", snippetType = "autosnippet"},
    fmta(
      [[
      \note{lime}{{{\large <> at <>}}}.
      %{{{{
      <>
      %}}}
      <>
      ]],
      {
        i(1, "Seminar"),
        f(function() return get_current_time() end),
        i(2),
        i(0)
      }
    ),
	{ condition = line_begin }
  ),
}
