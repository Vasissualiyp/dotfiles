-- Taken from https://github.com/evesdropper/dotfiles/blob/main/nvim/lua/snippets/tex/utils/scaffolding.lua

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local r = ls.restore_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local f = ls.function_node
local tsutils = require "config.tsutils"

-- Enable autosnippets
ls.config.setup({ enable_autosnippets = true })

-- generating function
local generate_matrix = function(args, snip)
	local rows = tonumber(snip.captures[2])
	local cols = tonumber(snip.captures[3])
	local nodes = {}
	local ins_indx = 1
	for j = 1, rows do
		table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
		ins_indx = ins_indx + 1
		for k = 2, cols do
			table.insert(nodes, t(" & "))
			table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1)))
			ins_indx = ins_indx + 1
		end
		table.insert(nodes, t({ "\\\\", "" }))
	end
	-- fix last node.
	nodes[#nodes] = t("\\\\")
	return sn(nil, nodes)
end

return {

s({trig = "([%sbBpvV])mat(%d+)x(%d+)", snippetType="autosnippet", regTrig = true, wordTrig=false, dscr = "[bBpvV]matrix of A x B size"},
    fmta([[
    \begin{<>}
    <>
    \end{<>}]],
    {
    f(function(_, snip)
        if  snip.captures[1] ==" " then
            return "matrix"
        else
            return snip.captures[1] .. "matrix"
        end
    end),
    d(1, generate_matrix),
    f(function(_, snip)
        return snip.captures[1] .. "matrix"
    end)
    }),
    { condition=tsutils.in_mathzone }
),
}
