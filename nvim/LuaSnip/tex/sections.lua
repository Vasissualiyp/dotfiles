local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  -- Chapter
  s("chap", fmta("\\chapter{<>}", { i(1) })),

  -- Section
  s("sec", fmta("\\section{<>}", { i(1) })),
  s("sec*", fmta("\\section*{<>}", { i(1) })),

  -- Subsection
  s("sub", fmta("\\subsection{<>}", { i(1) })),
  s("sub*", fmta("\\subsection*{<>}", { i(1) })),

  -- Subsubsection
  s("subsub", fmta("\\subsubsection{<>}", { i(1) })),
  s("subsub*", fmta("\\subsubsection*{<>}", { i(1) })),

  -- Paragraph
  s("par", fmta("\\paragraph{<>}", { i(1) })),
  s("par*", fmta("\\paragraph*{<>}", { i(1) })),

  -- Sub Paragraph
  s("subpar", fmta("\\subparagraph{<>}", { i(1) })),
  s("subpar*", fmta("\\subparagraph*{<>}", { i(1) })),

  -- Chapter with label
  s("chapl", fmta("\\chapter{<>}\n\\label{cha:<>}", { i(1), i(2, "\\chapter") })),

  -- Section with label
  s("secl", fmta("\\section{<>}\n\\label{sec:<>}", { i(1), i(2, "\\section") })),
  s("sec*l", fmta("\\section*{<>}\n\\label{sec:<>}", { i(1), i(2, "\\section*") })),

  -- Subsection with label
  s("subl", fmta("\\subsection{<>}\n\\label{sub:<>}", { i(1), i(2, "\\subsection") })),
  s("sub*l", fmta("\\subsection*{<>}\n\\label{sub:<>}", { i(1), i(2, "\\subsection*") })),

  -- Subsubsection with label
  s("subsubl", fmta("\\subsubsection{<>}\n\\label{ssub:<>}", { i(1), i(2, "\\subsubsection") })),
  s("subsub*l", fmta("\\subsubsection*{<>}\n\\label{ssub:<>}", { i(1), i(2, "\\subsubsection*") })),

  -- Paragraph with label
  s("parl", fmta("\\paragraph{<>}\n\\label{par:<>}", { i(1), i(2, "\\paragraph") })),
  s("par*l", fmta("\\paragraph*{<>}\n\\label{par:<>}", { i(1), i(2, "\\paragraph*") })),

  -- Sub Paragraph with label
  s("subparl", fmta("\\subparagraph{<>}\n\\label{subp:<>}", { i(1), i(2, "\\subparagraph") })),
  s("subpar*l", fmta("\\subparagraph*{<>}\n\\label{subp:<>}", { i(1), i(2, "\\subparagraph*") })),
}
