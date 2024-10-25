local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local tsutils = require "config.tsutils"

ls.config.setup({enable_autosnippets = true})
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })


local function not_in_mathzone()
  return not tsutils.in_mathzone()
end

return {
  -- Every entry contains a snippet for being in the math block, and for being outside of it
  -- for writing single variables
  as({ trig = ";a"}, t "\\alpha", { condition = tsutils.in_mathzone }),
  as({ trig = ";a"}, t "$\\alpha$", { condition = not_in_mathzone }),

  as( { trig = ";b" }, { t("\\beta") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";b" }, { t("$\\beta$") }, {condition = not_in_mathzone }),

  as( { trig = ";g" }, { t("\\gamma") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";g" }, { t("$\\gamma$") }, {condition = not_in_mathzone }),

  as( { trig = ";d" }, { t("\\delta") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";d" }, { t("$\\delta$") }, {condition = not_in_mathzone }),

  as( { trig = ";eps" }, { t("\\epsilon") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";eps" }, { t("$\\epsilon$") }, {condition = not_in_mathzone }),

  as( { trig = ";veps" }, { t("\\varepsilon") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";veps" }, { t("$\\varepsilon$") }, {condition = not_in_mathzone }),

  as( { trig = ";z" }, { t("\\zeta") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";z" }, { t("$\\zeta$") }, {condition = not_in_mathzone }),

  as( { trig = ";eta" }, { t("\\eta") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";eta" }, { t("$\\eta$") }, {condition = not_in_mathzone }),

  as( { trig = ";th" }, { t("\\theta") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";th" }, { t("$\\theta$") }, {condition = not_in_mathzone }),

  as( { trig = ";vth" }, { t("\\vartheta") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";vth" }, { t("$\\vartheta$") }, {condition = not_in_mathzone }),

  as( { trig = ";i" }, { t("\\iota") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";i" }, { t("$\\iota$") }, {condition = not_in_mathzone }),

  as( { trig = ";k" }, { t("\\kappa") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";k" }, { t("$\\kappa$") }, {condition = not_in_mathzone }),

  as( { trig = ";l" }, { t("\\lambda") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";l" }, { t("$\\lambda$") }, {condition = not_in_mathzone }),

  as( { trig = ";vl" }, { t("\\ell") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";vl" }, { t("$\\ell$") }, {condition = not_in_mathzone }),

  as( { trig = ";n" }, { t("\\nu") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";n" }, { t("$\\nu$") }, {condition = not_in_mathzone }),

  as( { trig = ";m" }, { t("\\mu") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";m" }, { t("$\\mu$") }, {condition = not_in_mathzone }),

  as( { trig = ";x" }, { t("\\xi") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";x" }, { t("$\\xi$") }, {condition = not_in_mathzone }),

  as( { trig = ";pi" }, { t("\\pi") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";pi" }, { t("$\\pi$") }, {condition = not_in_mathzone }),

  as( { trig = ";f" }, { t("\\phi") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";f" }, { t("$\\phi$") }, {condition = not_in_mathzone }),

  as( { trig = ";vf" }, { t("\\varphi") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";vf" }, { t("$\\varphi$") }, {condition = not_in_mathzone }),

  as( { trig = ";r" }, { t("\\rho") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";r" }, { t("$\\rho$") }, {condition = not_in_mathzone }),

  as( { trig = ";s" }, { t("\\sigma") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";s" }, { t("$\\sigma$") }, {condition = not_in_mathzone }),

  as( { trig = ";t" }, { t("\\tau") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";t" }, { t("$\\tau$") }, {condition = not_in_mathzone }),

  as( { trig = ";u" }, { t("\\upsilon") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";u" }, { t("$\\upsilon$") }, {condition = not_in_mathzone }),

  as( { trig = ";F" }, { t("\\Phi") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";F" }, { t("$\\Phi$") }, {condition = not_in_mathzone }),

  as( { trig = ";G" }, { t("\\Gamma") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";G" }, { t("$\\Gamma$") }, {condition = not_in_mathzone }),

  as( { trig = ";c" }, { t("\\chi") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";c" }, { t("$\\chi$") }, {condition = not_in_mathzone }),

  as( { trig = ";psi" }, { t("\\psi") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";psi" }, { t("$\\psi$") }, {condition = not_in_mathzone }),

  as( { trig = ";o" }, { t("\\omega") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";o" }, { t("$\\omega$") }, {condition = not_in_mathzone }),

  as( { trig = ";D" }, { t("\\Delta") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";D" }, { t("$\\Delta$") }, {condition = not_in_mathzone }),

  as( { trig = ";T" }, { t("\\Theta") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";T" }, { t("$\\Theta$") }, {condition = not_in_mathzone }),

  as( { trig = ";L" }, { t("\\Lambda") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";L" }, { t("$\\Lambda$") }, {condition = not_in_mathzone }),

  as( { trig = ";X" }, { t("\\Xi") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";X" }, { t("$\\Xi$") }, {condition = not_in_mathzone }),

  as( { trig = ";P" }, { t("\\Pi") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";P" }, { t("$\\Pi$") }, {condition = not_in_mathzone }),

  as( { trig = ";vr" }, { t("\\varrho") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";vr" }, { t("$\\varrho$") }, {condition = not_in_mathzone }),

  as( { trig = ";S" }, { t("\\Sigma") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";S" }, { t("$\\Sigma$") }, {condition = not_in_mathzone }),

  as( { trig = ";U" }, { t("\\Upsilon") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";U" }, { t("$\\Upsilon$") }, {condition = not_in_mathzone }),

  as( { trig = ";Psi" }, { t("\\Psi") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";Psi" }, { t("$\\Psi$") }, {condition = not_in_mathzone }),

  as( { trig = ";O" }, { t("\\Omega") }, {condition = tsutils.in_mathzone }),
  as( { trig = ";O" }, { t("$\\Omega$") }, {condition = not_in_mathzone }),
}
