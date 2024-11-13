local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local t = ls.text_node
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

  s({trig="ali*", dscr="A LaTeX align* environment"},
    fmta(
      [[
        \begin{align*}
            <>
        \end{align*}
      ]],
      { i(1) }
    )
  ),

  s({trig="ali", dscr="A LaTeX align environment"},
    fmta(
      [[
        \begin{align}
            <>
        \end{align}
      ]],
      { i(1) }
    )
  ),

  as({trig="cas(", dscr="A LaTeX cases environment"},
    fmta(
      [[
\begin{equation}
\left(
\begin{align}
    <>
\end{align}
\right.
\end{equation}
      ]],
      { i(1) }
    )
  ),

  as({trig="cas[", dscr="A LaTeX cases environment"},
    fmta(
      [[
\begin{equation}
\left[
\begin{align}
    <>
\end{align}
\right.
\end{equation}
      ]],
      { i(1) }
    )
  ),

  as({trig="cas{", dscr="A LaTeX equation system environment"},
    fmta(
      [[
\begin{equation}
\left\{
\begin{align}
    <>
\end{align}
\right.
\end{equation}
      ]],
      { i(1) }
    )
  ),

  as({ trig = "itm"}, t "\\item", { condition = not_in_mathzone }),

  s({trig="fig", dscr="A LaTeX figure environment"},{
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
  s({trig="fig*", dscr="A LaTeX figure environment"},{
      t("\\begin{figure*}["),
      i(1, "htpb"),
      t({"]", "\t\\centering"}),
      i(2, "\\includegraphics[width=0.8\\textwidth]{"),
      i(3),
      t({"}", "\t\\caption{"}),
      i(4),
      t({"}", "\\end{figure*}", "\\FloatBarrier"}),
      i(0),
  }),
}
