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
  -- Schrodinger Equation (Time-Dependent)
  as( { trig = "eqschtd",
       name = "Time-Dependent Schrodinger Equation",
       dscr = "Time-dependent Schrodinger equation"},
    { t("i \\hbar \\frac{\\partial}{\\partial t} \\psi(\\vec{r}, t) = \\hat{H} \\psi(\\vec{r}, t)") },
	{condition = tsutils.in_mathzone }
  ),

  -- Schrodinger Equation (Time-Independent)
  as( { trig = "eqschti",
       name = "Time-Independent Schrodinger Equation",
       dscr = "Time-independent Schrodinger equation"},
    { t("\\hat{H} \\psi(\\vec{r}) = E \\psi(\\vec{r})") },
	{condition = tsutils.in_mathzone }
  ),

  -- Einstein Field Equation
  as( { trig = "efe",
       name = "Einstein Field Equation",
       dscr = "Einstein field equations of general relativity"},
    { t("R_{\\mu\\nu} - \\frac{1}{2} R g_{\\mu\\nu} + \\Lambda g_{\\mu\\nu} = \\frac{8\\pi G}{c^4} T_{\\mu\\nu}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Maxwell's Equations (Differential Form)
  as( { trig = "eqmax",
       name = "Maxwell's Equations (Differential Form)",
       dscr = "Set of Maxwell's equations in differential form"},
    { t({
      "\\begin{align}",
      "\\nabla \\cdot \\vec{E} &= \\frac{\\rho}{\\varepsilon_0},\\\\",
      "\\nabla \\cdot \\vec{B} &= 0,\\\\",
      "\\nabla \\times \\vec{E} &= -\\frac{\\partial \\vec{B}}{\\partial t},\\\\",
      "\\nabla \\times \\vec{B} &= \\mu_0 \\vec{J} + \\mu_0 \\varepsilon_0 \\frac{\\partial \\vec{E}}{\\partial t},\\\\",
      "\\end{align}",
    }) },
	{condition = tsutils.in_mathzone }
  ),

  -- Partition Function (Thermodynamics)
  as( { trig = "eqpart",
       name = "Partition Function",
       dscr = "Partition function for a system in statistical mechanics"},
    { t("Z = \\sum_{i} e^{-\\beta E_i}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Planck's Law of Blackbody Radiation
  as( { trig = "eqbbr",
       name = "Planck's Law",
       dscr = "Planck's law for blackbody radiation"},
    { t("B_{\\nu}(\\nu, T) = \\frac{2h\\nu^3}{c^2} \\frac{1}{e^{h\\nu / k_B T} - 1}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Friedmann Equation
  as( { trig = "eqfr",
       name = "Friedmann Equation",
       dscr = "Friedmann equation describing the expansion of the Universe"},
    { t("\\left(\\frac{\\dot{a}}{a}\\right)^2 = \\frac{8\\pi G}{3} \\rho - \\frac{k}{a^2} + \\frac{\\Lambda}{3}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Debye Length (Plasma Physics)
  as( { trig = "eqdeb",
       name = "Debye Length",
       dscr = "Formula for the Debye length in plasma physics"},
    { t("\\lambda_D = \\sqrt{\\frac{\\varepsilon_0 k_B T_e}{n_e e^2}}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Energy-Momentum Relation
  as( { trig = "eqem",
       name = "Energy-Momentum Relation",
       dscr = "Relativistic energy-momentum relation"},
    { t("E^2 = (pc)^2 + (m c^2)^2") },
	{condition = tsutils.in_mathzone }
  ),

  -- Klein-Gordon Equation
  as( { trig = "eqkg",
       name = "Klein-Gordon Equation",
       dscr = "Klein-Gordon equation for a scalar field"},
    { t("\\Box \\phi + \\frac{m^2 c^2}{\\hbar^2} \\phi = 0") },
	{condition = tsutils.in_mathzone }
  ),

  -- Dirac Equation
  as( { trig = "eqdir",
       name = "Dirac Equation",
       dscr = "Dirac equation for relativistic quantum mechanics"},
    { t("(i \\gamma^\\mu \\partial_\\mu - m) \\psi = 0") },
	{condition = tsutils.in_mathzone }
  ),

  -- Poisson Equation
  as( { trig = "eqps",
       name = "Poisson Equation",
       dscr = "Poisson equation for scalar potential"},
    { t("\\nabla^2 \\phi = -\\frac{\\rho}{\\varepsilon_0}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Helmholtz Equation
  as( { trig = "eqhelm",
       name = "Helmholtz Equation",
       dscr = "Helmholtz equation for wave-like phenomena"},
    { t("\\nabla^2 \\psi + k^2 \\psi = 0") },
	{condition = tsutils.in_mathzone }
  ),

  -- Navier-Stokes Equation
  as( { trig = "eqns",
       name = "Navier-Stokes Equation",
       dscr = "Navier-Stokes equation for fluid dynamics"},
    { t("\\rho \\left( \\frac{\\partial \\vec{v}}{\\partial t} + (\\vec{v} \\cdot \\nabla) \\vec{v} \\right) = -\\nabla p + \\mu \\nabla^2 \\vec{v} + \\vec{f}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Continuity Equation
  as( { trig = "eqcont",
       name = "Continuity Equation",
       dscr = "Continuity equation for mass conservation"},
    { t("\\frac{\\partial \\rho}{\\partial t} + \\nabla \\cdot (\\rho \\vec{v}) = 0") },
	{condition = tsutils.in_mathzone }
  ),

  -- Stefan-Boltzmann Law
  as( { trig = "eqsb",
       name = "Stefan-Boltzmann Law",
       dscr = "Stefan-Boltzmann law for blackbody radiation"},
    { t("P = \\sigma T^4") },
	{condition = tsutils.in_mathzone }
  ),

  -- Virial Theorem
  as( { trig = "eqvir",
       name = "Virial Theorem",
       dscr = "Virial theorem for systems in equilibrium"},
    { t("2 \\langle T \\rangle = - \\langle U \\rangle") },
	{condition = tsutils.in_mathzone }
  ),

  -- Rayleigh-Jeans Law
  as( { trig = "eqrj",
       name = "Rayleigh-Jeans Law",
       dscr = "Rayleigh-Jeans law for blackbody radiation"},
    { t("B_{\\nu}(\\nu, T) = \\frac{2 \\nu^2 k_B T}{c^2}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Bekenstein-Hawking Entropy
  as( { trig = "eqbhe",
       name = "Bekenstein-Hawking Entropy",
       dscr = "Bekenstein-Hawking entropy for black holes"},
    { t("S = \\frac{k_B c^3 A}{4 G \\hbar}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Jeans Instability Criterion
  as( { trig = "eqjeans",
       name = "Jeans Instability Criterion",
       dscr = "Jeans instability criterion for gravitational collapse"},
    { t("\\lambda_J = \\sqrt{\\frac{\\pi c_s^2}{G \\rho}}") },
	{condition = tsutils.in_mathzone }
  ),
  -- Euler Equation (Hydrodynamics)
  as( { trig = "eqeul",
       name = "Euler Equation",
       dscr = "Euler equation for inviscid fluid flow"},
    { t("\\frac{\\partial \\vec{v}}{\\partial t} + (\\vec{v} \\cdot \\nabla) \\vec{v} = -\\frac{1}{\\rho} \\nabla p + \\vec{f}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Energy Equation (Fluid Dynamics)
  as( { trig = "eqene",
       name = "Energy Equation",
       dscr = "Energy conservation in fluid dynamics"},
    { t("\\frac{\\partial E}{\\partial t} + \\nabla \\cdot \\left( E + p \\right) \\vec{v} = 0") },
	{condition = tsutils.in_mathzone }
  ),

  -- Reynolds-Averaged Navier-Stokes (RANS) Equation
  as( { trig = "eqrans",
       name = "RANS Equation",
       dscr = "Reynolds-Averaged Navier-Stokes equation"},
    { t("\\rho \\frac{\\partial \\vec{v}}{\\partial t} + \\rho (\\vec{v} \\cdot \\nabla) \\vec{v} = -\\nabla \\bar{p} + \\nabla \\cdot \\bar{\\tau} - \\nabla \\cdot (\\rho \\vec{v}' \\vec{v}')") },
	{condition = tsutils.in_mathzone }
  ),

  -- Friedmann-Lemaître Equation
  as( { trig = "eqfle",
       name = "Friedmann-Lemaître Equation",
       dscr = "Friedmann-Lemaître equation for cosmological dynamics"},
    { t("\\frac{\\ddot{a}}{a} = -\\frac{4\\pi G}{3} \\left( \\rho + 3\\frac{p}{c^2} \\right) + \\frac{\\Lambda c^2}{3}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Matter Density Parameter
  as( { trig = "eqmdp",
       name = "Matter Density Parameter",
       dscr = "Density parameter for matter in cosmology"},
    { t("\\Omega_m = \\frac{\\rho_m}{\\rho_{\\text{crit}}}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Baryonic Acoustic Oscillations (Scale)
  as( { trig = "eqbao",
       name = "Baryonic Acoustic Oscillations",
       dscr = "BAO characteristic scale relation"},
    { t("r_s = \\int_{z_d}^{\\infty} \\frac{c_s dz}{H(z)}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Cosmological Redshift
  as( { trig = "eqred",
       name = "Cosmological Redshift",
       dscr = "Relation for redshift in an expanding universe"},
    { t("1 + z = \\frac{a_0}{a}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Jeans Length (Hydrodynamics)
  as( { trig = "eqjl",
       name = "Jeans Length",
       dscr = "Critical length scale for gravitational collapse"},
    { t("\\lambda_J = \\sqrt{\\frac{\\pi c_s^2}{G \\rho}}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Flux-Limited Diffusion Equation
  as( { trig = "eqfld",
       name = "Flux-Limited Diffusion Equation",
       dscr = "Equation for radiative transfer using flux-limited diffusion"},
    { t("\\frac{\\partial E}{\\partial t} - \\nabla \\cdot \\left( D \\nabla E \\right) = -\\kappa c E") },
	{condition = tsutils.in_mathzone }
  ),

  -- Zel'dovich Approximation (Structure Formation)
  as( { trig = "eqzel",
       name = "Zel'dovich Approximation",
       dscr = "Zel'dovich approximation for large-scale structure formation"},
    { t("\\vec{x}(t) = \\vec{q} + D(t) \\nabla \\psi(\\vec{q})") },
	{condition = tsutils.in_mathzone }
  ),
  -- Growth Factor (D(t))
  as( { trig = "eqDt",
       name = "Growth Factor D(t)",
       dscr = "Growth factor for density perturbations in cosmology"},
    { t("D(t) \\propto H(t) \\int_0^t \\frac{dt'}{a^3(t') H(t')}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Scale Factor as a Function of Redshift (a(z))
  as( { trig = "eqaofz",
       name = "Scale Factor a(z)",
       dscr = "Scale factor as a function of redshift"},
    { t("a(z) = \\frac{1}{1 + z}") },
	{condition = tsutils.in_mathzone }
  ),

  -- Redshift as a Function of Scale Factor (z(a))
  as( { trig = "eqzofa",
       name = "Redshift z(a)",
       dscr = "Redshift as a function of the scale factor"},
    { t("z(a) = \\frac{1}{a} - 1") },
	{condition = tsutils.in_mathzone }
  ),

  -- MUSIC: Power Spectrum
  as( { trig = "eqps",
       name = "MUSIC Power Spectrum",
       dscr = "Initial power spectrum for MUSIC simulations"},
    { t("P(k) = \\langle |\\delta_k|^2 \\rangle") },
	{condition = tsutils.in_mathzone }
  ),

  -- MUSIC: Transfer Function
  as( { trig = "eqtf",
       name = "MUSIC Transfer Function",
       dscr = "Transfer function for MUSIC multiscale initial conditions"},
    { t("T(k) = \\frac{\\delta(k)}{\\delta(k_{\\text{initial}})}") },
	{condition = tsutils.in_mathzone }
  ),

  -- GIZMO: SPH Kernel
  as( { trig = "eqsph",
       name = "SPH Kernel Function",
       dscr = "Smoothing kernel function used in GIZMO simulations"},
    { t("W(r, h) = \\frac{\\sigma}{h^d} f\\left(\\frac{r}{h}\\right)") },
	{condition = tsutils.in_mathzone }
  ),

  -- GIZMO: Cooling Function
  as( { trig = "eqcool",
       name = "Cooling Function",
       dscr = "Cooling function for gas in GIZMO simulations"},
    { t("\\Lambda(T) = \\sum_i \\Lambda_i(T) n_i n_e") },
	{condition = tsutils.in_mathzone }
  ),

  -- Hubble Parameter (H(z))
  as( { trig = "eqhub",
       name = "Hubble Parameter H(z)",
       dscr = "Hubble parameter as a function of redshift"},
    { t("H(z) = H_0 \\sqrt{\\Omega_m (1+z)^3 + \\Omega_\\Lambda + \\Omega_k (1+z)^2}") },
	{condition = tsutils.in_mathzone }
  ),

  as( { trig = "4pir2",
       name = "Surface of a sphere",
       dscr = "Surface of a sphere"},
    { t("4 \\pi r^2") },
	{condition = tsutils.in_mathzone }
  ),

  as( { trig = "43pir3",
       name = "Volume of a sphere",
       dscr = "Volume of a sphere"},
    { t("\\frac{4}{3} \\pi r^3") },
	{condition = tsutils.in_mathzone }
  ),

  -- Peculiar Velocity
  as( { trig = "eqpecv",
       name = "Peculiar Velocity",
       dscr = "Peculiar velocity in a cosmological context"},
    { t("\\vec{v}_p = \\vec{v} - H(t) \\vec{r}") },
	{condition = tsutils.in_mathzone }
  ),
}
