local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local c = ls.choice_node
ls.config.setup({ enable_autosnippets = true })

local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local function verbatim_snippet(args, parent)
  local col = vim.fn.col(".") - 1 -- Current column (0-based)
  if col == 0 then
    -- At line start: offer choice between \begin{verbatim} and \verb
    return ls.sn(nil, {
      c(1, {
        -- First choice: \begin{verbatim}...\end{verbatim}
        ls.sn(nil, {
          t({ "\\begin{verbatim}", "" }),
          i(1),
          t({ "", "\\end{verbatim}" }),
          i(0),
        }),
        -- Second choice: \verb|...|
        ls.sn(nil, {
          t("\\verb|"),
          i(1),
          t("|"),
          i(0),
        }),
      }),
    })
  else
    -- Not at line start: directly use \verb
    return ls.sn(nil, {
      t("\\verb|"),
      i(1),
      t("|"),
      i(0),
    })
  end
end


return {
    s({trig="url", dscr="The hyperref package's href{}{} command (for url links)"},
      fmta(
        [[\href{<>}{<>}]],
        {
          i(1, "url"),
          i(2, "display name"),
        }
      )
    ),
    as("vem", {
      d(1, verbatim_snippet)
  }),
  as({trig = "VV"}, { t("{\\textcolor{green}{\\checkmark}}")}),
  as({trig = "XX"}, { t("{\\textcolor{red}{X}}")}),
  as({trig = "lcdm"}, { t("$\\Lambda$CDM") }),
  as({trig = "H2"}, { t("H$_2$") }),
  as({trig = "h2"}, { t("H$_2$") }),
}


-- 
-- snippet time "Current Time" w
-- `date +%H:%M`
-- endsnippet
-- 
-- snippet vsp "vspace" bA
-- \vspace{${1:5mm}}
-- 
-- $0
-- endsnippet
-- 
-- snippet hln "line with vspace" bA
-- \hline \vspace{${1:5mm}}
-- 
-- $0
-- endsnippet
-- 
-- #VASILII CODING SNIPS#
-- 
-- snippet rtn "Description of routine"
-- \subsection{$1}
-- \begin{itemize}
-- 	\item[] \textbf{Locaiton:} 
-- 		\verb|$2|
-- 
-- 	\item[] \textbf{Subroutine name:} 
-- 		\verb|$3|
-- 
-- 	\item[] \textbf{Purpose:}
-- 		$4
-- \end{itemize}
-- $0
-- endsnippet 
-- 
-- snippet niagara "Address of files on Niagara" w
-- vasissua@niagara.scinet.utoronto.ca:/scratch/m/murray/vasissua
-- endsnippet
-- 
-- snippet path "Filepath" w
-- \href{run:$1}{Location}
-- endsnippet
-- 
-- snippet cite "cite" w
-- \cite{$1} $0
-- endsnippet
-- 
-- 
-- # Character modifiers 
-- snippet "(\\?\w+)(,\.|\.,)" "Vector postfix" riA
-- \vec{`!p snip.rv=match.group(1)`}
-- endsnippet
-- 
-- snippet "(\\?\W+)(\.a)" "Angled brackets postfix" riA
-- \left< `!p snip.rv=match.group(1)` \right>
-- endsnippet
-- 
-- snippet "(\\?\w+)(\.H)" "Harpoons postfix" riA
-- \lrharpoon{`!p snip.rv=match.group(1)`}
-- endsnippet
-- 
-- snippet "(\\?\w+)(\.h)" "Hat postfix" riA
-- \hat{`!p snip.rv=match.group(1)`}
-- endsnippet
-- 
-- snippet "(\\?\w+)(\.t)" "Tilde postfix" riA
-- \tilde{`!p snip.rv=match.group(1)`} 
-- endsnippet
-- 
-- snippet "(\\?\w+)(\.b)" "Bar postfix" riA
-- \bar{`!p snip.rv=match.group(1)`} 
-- endsnippet
-- 
-- snippet h "hat" w
-- \hat{$1}$0
-- endsnippet
-- 
-- snippet v "vector" w
-- \Vec{$1}$0
-- endsnippet
-- 
-- snippet ol "overline" w
-- \overline{$1}$0
-- endsnippet
-- 
-- snippet ul "underline" w
-- \uline{$1}$0
-- endsnippet
-- 
-- 
-- snippet o+ "oplus" w
-- \oplus
-- endsnippet
-- 
-- snippet \otimes "nothing, no answer" w
-- \varnothing
-- endsnippet
-- 
-- snippet ox "otimes" w
-- \otimes
-- endsnippet
-- 
-- 
-- snippet /~ "Similar in text" w
-- $ \sim $1 $ $0
-- endsnippet
-- 
-- snippet o< "proportional" wA
-- \propto 
-- endsnippet
-- 
-- snippet pl "Parallel" i
-- \parallel
-- endsnippet
-- 
-- snippet pd "Perpendicular" i
-- \bot
-- endsnippet
-- 
-- snippet nb "nabla" wA
-- \nabla 
-- endsnippet
-- 
-- snippet vnb "vector nabla" wA
-- \Vec{\nabla} 
-- endsnippet
-- 
-- snippet nabl "nabla" wA
-- \nabla 
-- endsnippet
-- 
-- snippet vnabl "vector nabla" wA
-- \Vec{\nabla} 
-- endsnippet
-- 
-- 
-- 
-- snippet red~ "redshfit" wA
-- redshift $z \sim $1$ $0
-- endsnippet
-- 
-- snippet red> "redshfit" wA
-- redshift $z > $1$ $0
-- endsnippet
-- 
-- snippet red< "redshfit" wA
-- redshift $z < $1$ $0
-- endsnippet
-- 
-- snippet red= "redshfit" wA
-- redshift $z = $1$ $0
-- endsnippet
-- 
-- snippet Lya "Lyman-alpha" wA
-- Lyman-$\alpha$ $0
-- endsnippet
-- 
-- 
-- # Formatting 
-- 
-- snippet lstl "lstlisting (same as verbatim)" bi
-- \begin{lstlisting}
-- ${0:${VISUAL}}
-- \end{lstlisting}
-- endsnippet
-- 
-- snippet cas[ "cases []" biA
-- \begin{equation}
-- \left[
-- \begin{aligned}
-- 	${0:${VISUAL}}
-- \end{aligned}
-- \right.
-- \end{equation}
-- endsnippet
-- 
-- snippet cas{ "cases {}" biA
-- \begin{equation}
-- \left\{
-- \begin{aligned}
-- 	${0:${VISUAL}}
-- \end{aligned}
-- \right.
-- \end{equation}
-- endsnippet
-- 
-- snippet cas( "cases ()" biA
-- \begin{equation}
-- \left(
-- \begin{aligned}
-- 	${0:${VISUAL}}
-- \end{aligned}
-- \right.
-- \end{equation}
-- endsnippet
-- 
-- 
-- snippet 1st "1st" wA
-- 1$^\text{st}$ 
-- endsnippet
-- 
-- snippet 2nd "2nd" wA
-- 2$^\text{nd}$ 
-- endsnippet
-- 
-- snippet 3rd "3rd" wA
-- 3$^\text{rd}$ 
-- endsnippet
-- 
-- # This ordinal (general nth) doesn't work!
-- snippet "`(\d+)(st|nd|rd|th)`" "General ordinal" r
-- $1$^\text{$2}$
-- endsnippet
-- 
-- snippet neur "Neural" w
-- <c-o>:ls
-- endsnippet
-- 
-- 
-- # Matrix generator 
-- post_jump "create_matrix_placeholders(snip)"
-- snippet 'mx-(\d+)-(\d+)' "LaTeX array" br
-- \begin{pmatrix}{`!p
-- orient = ""
-- for _ in range(0, int(match.group(1))): orient += "l"
-- snip.rv = orient`}
-- `!p
-- snip.rv = create_matrix(match.group(1), match.group(2), "&", "\t", "\\\\\\\\\n")
-- `$0
-- \end{pmatrix}
-- endsnippet
-- 
-- 
-- # vim:ft=snippets:
