local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local tsutils = require("config.tsutils")  -- Assuming tsutils is correctly set up

-- Define the condition functions
local function not_in_mathzone()
  return not tsutils.in_mathzone()
end

local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

return {
  as({ trig = "dint" }, 
    fmta(
      "\\int <> \\, \\mathrm{{d}} <> <>",
      { i(1, "${VISUAL}"), i(2, "x"), i(0) },
      { condition = tsutils.in_mathzone }
    )
  ),
  as({ trig = "cint" }, 
    fmta(
      "\\oint\\limits_{{<>}} <> \\, \\mathrm{{d}} <> <>",
      { i(1, "\\Gamma"), i(2, "${VISUAL}"), i(3, "\\gamma"), i(0) },
      { condition = tsutils.in_mathzone }
    )
  ),
  as({ trig = "ddint" }, 
    fmta(
      "\\int_{{<>}}^{{<>}} <> \\, \\mathrm{{d}} <> <>",
      { i(1, "-\\infty"), i(2, "\\infty"), i(3, "${VISUAL}"), i(4, "x"), i(0) },
      { condition = tsutils.in_mathzone }
    )
  ),
}
