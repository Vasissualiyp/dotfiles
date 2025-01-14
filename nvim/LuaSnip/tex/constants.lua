local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
ls.config.setup({enable_autosnippets = true})
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local tsutils = require "config.tsutils"
local function not_in_mathzone()
  return not tsutils.in_mathzone()
end

return {
  -- Critical Density of the Universe
  s( { trig = "\\rho_crit",
       name = "Average Density of the Universe",
       dscr = "Value of the critical density of the Universe"},
    { t("2.77 \\times 10^11 h^2 M_{\\odot} / \\text{Mpc}^3") },
	{condition = tsutils.in_mathzone }
  ),
  
  -- Hubble Constant
  s( { trig = "H0",
       name = "Hubble Constant",
       dscr = "Hubble constant value"},
    { t("70 \\text{km} \\text{s}^{-1} \\text{Mpc}^{-1}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Planck Constant
  s( { trig = "\\hbar",
       name = "Planck Constant",
       dscr = "Value of Planck's constant"},
    { t("6.626 \\times 10^{-34} \\text{J} \\cdot \\text{s}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Gravitational Constant
  s( { trig = "G",
       name = "Gravitational Constant",
       dscr = "Value of the gravitational constant"},
    { t("6.674 \\times 10^{-11} \\text{m}^3 \\text{kg}^{-1} \\text{s}^{-2}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Speed of Light
  s( { trig = "c",
       name = "Speed of Light",
       dscr = "Value of the speed of light in vacuum"},
    { t("3 \\times 10^8 \\text{m} \\cdot \\text{s}^{-1}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Stefan-Boltzmann Constant
  s( { trig = "\\sigma",
       name = "Stefan-Boltzmann Constant",
       dscr = "Value of the Stefan-Boltzmann constant"},
    { t("5.67 \\times 10^{-8} \\text{W} \\text{m}^{-2} \\text{K}^{-4}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Boltzmann Constant
  s( { trig = "\\kB",
       name = "Boltzmann Constant",
       dscr = "Value of the Boltzmann constant"},
    { t("1.38 \\times 10^{-23} \\text{J} \\text{K}^{-1}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Solar Mass
  s( { trig = "Msol",
       name = "Solar Mass",
       dscr = "Value of the solar mass"},
    { t("1.989 \\times 10^{30} \\text{kg}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Density Parameter
  s( { trig = "\\Omega",
       name = "Density Parameter",
       dscr = "General density parameter in cosmology"},
    { t("\\frac{\\rho}{\\rho_{\\text{crit}}}") },
	{condition = tsutils.in_mathzone }
  ),
}
