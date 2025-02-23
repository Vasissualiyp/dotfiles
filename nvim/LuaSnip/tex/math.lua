local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local tsutils = require "config.tsutils"

local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local function not_in_mathzone()
  return not tsutils.in_mathzone()
end

return {
  as({trig = "nab"}, {t("\\nabla")}, { condition = tsutils.in_mathzone }),
  as({trig = "vnab"}, {t("\\Vec{\\nabla}")}, { condition = tsutils.in_mathzone }),
  as({trig = "ox"}, {t("\\otimes")}, { condition = tsutils.in_mathzone }),
  as({trig = "o+"}, {t("\\oplus")},  { condition = tsutils.in_mathzone }),
  s({trig = "cc"}, {t("\\subset ")}, { condition = tsutils.in_mathzone }),
  s({trig = "inn"}, {t("\\in ")}, {condition = tsutils.in_mathzone }),
  s({trig = "Nn"}, {t("\\cap ")}, {condition = tsutils.in_mathzone }),
  s({trig = "UU"}, {t("\\cup ")}, {condition = tsutils.in_mathzone }),
  s({trig = "uuu"}, {t("\\bigcup_{"), i(1, "i \\in "), i(2, "I"), t(" } "), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "nnn"}, {t("\\bigcap_{"), i(1, "i \\in "), i(2, "I"), t(" } "), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "HH"}, {t("\\mathbb{H}")}, {condition = tsutils.in_mathzone }),
  s({trig = "DD"}, {t("\\mathbb{D}")}, {condition = tsutils.in_mathzone }),
  s({trig = "inmath"}, {t("\\("), i(1), t("\\) "), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "frac"}, {t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0)}, {condition = tsutils.in_mathzone }),
  as({trig = "^^", wordTrig = false}, {t("^{" ), i(1), t("}"), i(0)}, {condition = tsutils.in_mathzone }),
  as({trig = "__", wordTrig = false}, {t("_{" ), i(1), t("}"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "srt"}, {t("\\sqrt{" ), i(1), t("}"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "srto"}, {t("\\sqrt["), i(1), t("]{"), i(2), t("}"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "tbf"}, {t("\\textbf{"), i(1), t("}"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "tit"}, {t("\\textit{"), i(1), t("}"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "tun"}, {t("\\underline{"), i(1), t("}"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "bf"}, {t("\\mathbf{"), i(1), t("}"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "it"}, {t("\\mtextit{"), i(1), t("}"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "ul"}, {t("\\underline{"), i(1), t("}"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "rm"}, {t("\\rm{"), i(1), t("}"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "itm"}, {t("\\item "), i(1), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "ceil"}, {t("\\left\\lceil "), i(1), t(" \\right\\rceil "), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "floor"}, {t("\\left\\lfloor "), i(1), t(" \\right\\rfloor"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "pmat"}, {t("\\begin{pmatrix} "), i(1), t(" \\end{pmatrix} "), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "bmat"}, {t("\\begin{bmatrix} "), i(1), t(" \\end{bmatrix} "), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "()"}, {t("\\left( "), i(1), t(" \\right)"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "lr"}, {t("\\left( "), i(1), t(" \\right)"), i(0)}, {condition = tsutils.in_mathzone }),
  as({trig = "lr("}, {t("\\left( "), i(1), t(" \\right)"), i(0)}, {condition = tsutils.in_mathzone }),
  as({trig = "lr|"}, {t("\\left| "), i(1), t(" \\right|"), i(0)}, {condition = tsutils.in_mathzone }),
  as({trig = "lr{"}, {t("\\left\\{ "), i(1), t(" \\right\\}"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "lrb"}, {t("\\left\\{ "), i(1), t(" \\right\\}"), i(0)}, {condition = tsutils.in_mathzone }),
  as({trig = "lr["}, {t("\\left[ "), i(1), t(" \\right]"), i(0)}, {condition = tsutils.in_mathzone }),
  as({trig = "lra"}, {t("\\left< "), i(1), t(" \\right>"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "conj"}, {t("\\overline{"), i(1), t("}"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "sum"}, {t("\\sum_{n="), i(1, "1"), t("}^{"), i(2, "\\infty"), t("} "), i(3, "a_n z^n"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "taylor"}, {t("\\sum_{"), i(1, "k"), t("="), i(2, "0"), t("}^{"), i(3, "\\infty"), t("} "), i(4, "c_$1 (x-a)^$1"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "lim"}, {t("\\lim_{"), i(1, "n"), t(" \\to "), i(2, "\\infty"), t("} "), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "limsup"}, {t("\\limsup_{"), i(1, "n"), t(" \\to "), i(2, "\\infty"), t("} "), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "prod"}, {t("\\prod_{"), i(1, "n="), i(2, "1"), t(" }^{"), i(3, "\\infty"), t("} "), i(4), t(" "), i(0)}, {condition = tsutils.in_mathzone }),
  as({trig = "ddx"}, {t("\\frac{\\mathrm{d} "), i(1, "V"), t("}{\\mathrm{d} "), i(2, "x"), t("} "), i(0)}, {condition = tsutils.in_mathzone }),
  as({trig = "pddx"}, {t("\\frac{\\partial "), i(1, "V"), t("}{\\partial "), i(2, "x"), t("} "), i(0)}, {condition = tsutils.in_mathzone }),
  as({trig = "ooo"}, {t("\\infty")}, {condition = tsutils.in_mathzone }),
  as({trig = "inf"}, {t("\\infty")}, { condition = tsutils.in_mathzone }, {condition = tsutils.in_mathzone }),
  s({trig = "rij"}, {t("(${1:x}_${2:n})_{"), i(3, "$2\\in"), i(4, "\\N"), t("}$0")}, {condition = tsutils.in_mathzone }),
  as({trig = "iff"}, {t("\\iff")}, {condition = tsutils.in_mathzone }),

  s({trig = "=="}, {t("&= "), i(1), t({" \\\\", ""}), i(0)}, {condition = tsutils.in_mathzone }),
  as({trig = "!="}, {t("\\neq")}, {condition = tsutils.in_mathzone }),
  s({trig = "=<"}, {t("\\le")}, {condition = tsutils.in_mathzone }),
  as({trig = ">="}, {t("\\ge")}, {condition = tsutils.in_mathzone }),
  as({trig = "<<"}, {t("\\ll")}, {condition = tsutils.in_mathzone }),
  s({trig = ">>"}, {t("\\gg")}, {condition = tsutils.in_mathzone }),
  as({trig = "~>"}, {t("\\gtrsim")}, {condition = tsutils.in_mathzone }),
  as({trig = ">~"}, {t("\\gtrsim")}, {condition = tsutils.in_mathzone }),
  as({trig = "~<"}, {t("\\lesssim")}, {condition = tsutils.in_mathzone }),
  as({trig = "<~"}, {t("\\lesssim")}, {condition = tsutils.in_mathzone }),
  as({trig = "~~"}, {t("\\approx")}, {condition = tsutils.in_mathzone }),
   s({trig = "~"},  {t("\\sim")}, {condition = tsutils.in_mathzone }),
  as({trig = "=~"}, {t("\\simeq")}, {condition = tsutils.in_mathzone }),
  as({trig = "~="}, {t("\\simeq")}, {condition = tsutils.in_mathzone }),
  as({trig = "=-"}, {t("\\equiv")}, {condition = tsutils.in_mathzone }),
  as({trig = "-="}, {t("\\equiv")}, {condition = tsutils.in_mathzone }),

  s({trig = "nn"}, {t("\\node["), i(5), t("] (${1/[^0-9a-zA-Z]//g}"), i(2), t(") "), i(3, "at (${4:0,0}) "), t("{$${1}$};\n"), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "lll"}, {t("\\ell")}, {condition = tsutils.in_mathzone }),
  s({trig = "."}, {t("\\cdot ")}, {condition = tsutils.in_mathzone }),
  s({trig = "*"}, {t("\\star ")}, {condition = tsutils.in_mathzone }),
  as({trig = "xx"}, {t("\\times ")}, {condition = tsutils.in_mathzone }),
  as({trig = "dot"}, {t("\\dot{"), i(1), t("} "), i(0)}, {condition = tsutils.in_mathzone }),
  as({trig = "ddot"}, {t("\\ddot{"), i(1), t("} "), i(0)}, {condition = tsutils.in_mathzone }),
  s({trig = "(?<!\\\\)(sin|cos|arccot|cot|csc|ln|log|exp|star|perp)", regTrig = true}, {t("\\", i(1))}, {condition = tsutils.in_mathzone }),
  as({trig = "<!"}, {t("\\triangleleft ")}, {condition = tsutils.in_mathzone }),
  as({trig = "((\\d|\\w)+)invs", regTrig = true}, {i(1), t("^{-1}")}, {condition = tsutils.in_mathzone }),
  as({trig = "!>"}, {t("\\mapsto ")}, {condition = tsutils.in_mathzone }),
  as({trig = "o<"}, {t("\\propto ")}, {condition = tsutils.in_mathzone }),

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
