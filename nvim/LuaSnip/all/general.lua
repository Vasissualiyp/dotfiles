local ls = require("luasnip")  -- Load LuaSnip

-- Create a snippet available for all file types
ls.add_snippets("all", {  -- 'all' makes it available for every filetype
    ls.parser.parse_snippet("pp", "PeakPatch ")  -- 'pp' triggers the snippet, "PeakPatch" is the text inserted
})
