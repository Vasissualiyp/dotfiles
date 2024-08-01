local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local tsutils = require "config.tsutils"

local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local function not_in_mathzone()
  return not tsutils.in_mathzone()
end

return {
  as({trig="item", dscr="A LaTeX itemize environment"},
    fmta( 
      [[
        \begin{itemize}
            <>
        \end{itemize}
      ]],
      { i(1) }
    )
  ),

  as({trig="enum", dscr="A LaTeX enumerate environment"},
    fmta( 
      [[
        \begin{enumerate}
            <>
        \end{enumerate}
      ]],
      { i(1) }
    )
  ),

  as({ trig = "itm"}, t "\\item", { condition = not_in_mathzone }),

  as("fig", {
      t("\\begin{figure}["),
      i(1, "htpb"),
      t({"]", "\t\\centering"}),
      i(2, "\\includegraphics[width=0.8\\textwidth]{"),
      i(3),
      t({"}", "\t\\caption{"}),
      i(4),
      t({"}", "\t\\label{fig:"}),
      f(function(args)
          return args[1][1]:gsub("%W+", "-")
      end, {3}),
      t({"}", "\\end{figure}", "\\FloatBarrier"}),
      i(0),
  }),
}
