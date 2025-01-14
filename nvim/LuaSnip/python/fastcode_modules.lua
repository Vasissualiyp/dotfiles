local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

ls.add_snippets("python", {
  s("read_csv", fmt([[
#import pandas as pd
csv_file_path = '{}'
var1 = '{}'
var2 = '{}'
type1 = {}
type2 = {}

df = pd.read_csv(csv_file_path)

{} = df[var1].astype(type1)
{} = df[var2].astype(type2)
  ]], {
    i(1, "path_to_your_file.csv"), -- Placeholder for CSV file path
    i(2, "Name of 1st column"),    -- Placeholder for the first column name
    i(3, "Name of 2nd column"),    -- Placeholder for the second column name
    i(4, "int"),                   -- Placeholder for the first column type
    i(5, "float"),                 -- Placeholder for the second column type
    i(6, "first_variable"),        -- Placeholder for the first variable name
    i(7, "second_variable")        -- Placeholder for the second variable name
  })),
  as({trig = "curvefit"}, {
	  t("from scipy.optimize import curve_fit"),
	  t("popt, pcov = curve_fit("),
      i(1,"funciton"),
	  t(", "),
      i(2,"x_data"),
	  t(", "),
      i(3,"y_data"),
	  t(")"),
      }),
})
