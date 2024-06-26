local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({trig = "cc"}, {t("\\subset ")}),
  s({trig = "inn"}, {t("\\in ")}),
  s({trig = "Nn"}, {t("\\cap ")}),
  s({trig = "UU"}, {t("\\cup ")}),
  s({trig = "uuu"}, {t("\\bigcup_{"), i(1, "i \\in "), i(2, "I"), t(" } "), i(0)}),
  s({trig = "nnn"}, {t("\\bigcap_{"), i(1, "i \\in "), i(2, "I"), t(" } "), i(0)}),
  s({trig = "HH"}, {t("\\mathbb{H}")}),
  s({trig = "DD"}, {t("\\mathbb{D}")}),
  s({trig = "inmath"}, {t("\\("), i(1), t("\\) "), i(0)}),
  s({trig = "dm"}, {t("\\[\n  "), i(1), t("\n\\]"), i(0)}),
  s({trig = "frac"}, {t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0)}),
  s({trig = "^^", snippetType = "autosnippet"}, {t("^{" ), i(1), t("}"), i(0)}),
  s({trig = "__", snippetType = "autosnippet"}, {t("_{" ), i(1), t("}"), i(0)}),
  s({trig = "srt"}, {t("\\sqrt{" ), i(1), t("}"), i(0)}),
  s({trig = "srto"}, {t("\\sqrt["), i(1), t("]{"), i(2), t("}"), i(0)}),
  s({trig = "tbf"}, {t("\\textbf{"), i(1), t("}"), i(0)}),
  s({trig = "tit"}, {t("\\textit{"), i(1), t("}"), i(0)}),
  s({trig = "tun"}, {t("\\underline{"), i(1), t("}"), i(0)}),
  s({trig = "mbf"}, {t("\\mathbf{"), i(1), t("}"), i(0)}),
  s({trig = "mit"}, {t("mtextit{"), i(1), t("}"), i(0)}),
  s({trig = "mun"}, {t("\\underline{"), i(1), t("}"), i(0)}),
  s({trig = "rm"}, {t("\\rm{"), i(1), t("}"), i(0)}),
  s({trig = "itm"}, {t("\\item "), i(1), i(0)}),
  s({trig = "ceil"}, {t("\\left\\lceil "), i(1), t(" \\right\\rceil "), i(0)}),
  s({trig = "floor"}, {t("\\left\\lfloor "), i(1), t(" \\right\\rfloor"), i(0)}),
  s({trig = "pmat"}, {t("\\begin{pmatrix} "), i(1), t(" \\end{pmatrix} "), i(0)}),
  s({trig = "bmat"}, {t("\\begin{bmatrix} "), i(1), t(" \\end{bmatrix} "), i(0)}),
  s({trig = "()"}, {t("\\left( "), i(1), t(" \\right)"), i(0)}),
  s({trig = "lr"}, {t("\\left( "), i(1), t(" \\right)"), i(0)}),
  s({trig = "lr(", snippetType = "autosnippet"}, {t("\\left( "), i(1), t(" \\right)"), i(0)}),
  s({trig = "lr|", snippetType = "autosnippet"}, {t("\\left| "), i(1), t(" \\right|"), i(0)}),
  s({trig = "lr{", snippetType = "autosnippet"}, {t("\\left\\{ "), i(1), t(" \\right\\}"), i(0)}),
  s({trig = "lrb"}, {t("\\left\\{ "), i(1), t(" \\right\\}"), i(0)}),
  s({trig = "lr[", snippetType = "autosnippet"}, {t("\\left[ "), i(1), t(" \\right]"), i(0)}),
  s({trig = "lra", snippetType = "autosnippet"}, {t("\\left< "), i(1), t(" \\right>"), i(0)}),
  s({trig = "conj"}, {t("\\overline{"), i(1), t("}"), i(0)}),
  s({trig = "sum"}, {t("\\sum_{n="), i(1, "1"), t("}^{"), i(2, "\\infty"), t("} "), i(3, "a_n z^n"), i(0)}),
  s({trig = "taylor"}, {t("\\sum_{"), i(1, "k"), t("="), i(2, "0"), t("}^{"), i(3, "\\infty"), t("} "), i(4, "c_$1 (x-a)^$1"), i(0)}),
  s({trig = "lim"}, {t("\\lim_{"), i(1, "n"), t(" \\to "), i(2, "\\infty"), t("} "), i(0)}),
  s({trig = "limsup"}, {t("\\limsup_{"), i(1, "n"), t(" \\to "), i(2, "\\infty"), t("} "), i(0)}),
  s({trig = "prod"}, {t("\\prod_{"), i(1, "n="), i(2, "1"), t(" }^{"), i(3, "\\infty"), t("} "), i(4), t(" "), i(0)}),
  s({trig = "ddx", snippetType = "autosnippet"}, {t("\\frac{\\mathrm{d} "), i(1, "V"), t("}{\\mathrm{d} "), i(2, "x"), t("} "), i(0)}),
  s({trig = "pddx", snippetType = "autosnippet"}, {t("\\frac{\\partial "), i(1, "V"), t("}{\\partial "), i(2, "x"), t("} "), i(0)}),
  s({trig = "ooo", snippetType = "autosnippet"}, {t("\\infty")}),
  s({trig = "rij"}, {t("(${1:x}_${2:n})_{"), i(3, "$2\\in"), i(4, "\\N"), t("}$0")}),
  s({trig = "iff", snippetType = "autosnippet"}, {t("\\iff")}),
  s({trig = "=="}, {t("&= "), i(1), t(" \\\\\n"), i(0)}),
  s({trig = "!=", snippetType = "autosnippet"}, {t("\\neq")}),
  s({trig = "=<"}, {t("\\le")}),
  s({trig = ">=", snippetType = "autosnippet"}, {t("\\ge")}),
  s({trig = "<<", snippetType = "autosnippet"}, {t("\\ll")}),
  s({trig = ">>"}, {t("\\gg")}),
  s({trig = "~>", snippetType = "autosnippet"}, {t("\\gtrsim")}),
  s({trig = ">~", snippetType = "autosnippet"}, {t("\\gtrsim")}),
  s({trig = "~<", snippetType = "autosnippet"}, {t("\\lesssim")}),
  s({trig = "<~", snippetType = "autosnippet"}, {t("\\lesssim")}),
  s({trig = "nn"}, {t("\\node["), i(5), t("] (${1/[^0-9a-zA-Z]//g}"), i(2), t(") "), i(3, "at (${4:0,0}) "), t("{$${1}$};\n"), i(0)}),
  s({trig = "lll"}, {t("\\ell")}),
  s({trig = "."}, {t("\\cdot ")}),
  s({trig = "*"}, {t("\\star ")}),
  s({trig = "xx", snippetType = "autosnippet"}, {t("\\times ")}),
  s({trig = "dot", snippetType = "autosnippet"}, {t("\\dot{"), i(1), t("} "), i(0)}),
  s({trig = "ddot", snippetType = "autosnippet"}, {t("\\ddot{"), i(1), t("} "), i(0)}),
  s({trig = "(?<!\\\\)(sin|cos|arccot|cot|csc|ln|log|exp|star|perp)", regTrig = true}, {t("\\", i(1))}),
  s({trig = "<!", snippetType = "autosnippet"}, {t("\\triangleleft ")}),
  s({trig = "((\\d|\\w)+)invs", regTrig = true, snippetType = "autosnippet"}, {i(1), t("^{-1}")}),
  s({trig = "!>", snippetType = "autosnippet"}, {t("\\mapsto ")}),

  s({trig="eq", dscr="A LaTeX equation environment"},
    fmta( 
      [[
        \begin{equation}
            <>
        \end{equation}
      ]],
      { i(1) }
    )
  ),
  s({trig="eq*", dscr="A LaTeX equation environment"},
    fmta( 
      [[
        \begin{equation*}
            <>
        \end{equation*}
      ]],
      { i(1) }
    )
  ),
}
