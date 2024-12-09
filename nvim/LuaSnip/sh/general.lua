local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

return {
  as({trig = "#!", name = "Shebang", dscr = "Bash shebang line"}, { t("#!/usr/bin/env bash") }),
  s({trig = "="}, { t("-eq") }),
  s({trig = "!="}, { t("-ne") }),
  s({trig = "<"}, { t("-lt") }),
  s({trig = "=<"}, { t("-le") }),
  s({trig = "<="}, { t("-le") }),
  s({trig = ">"}, { t("-gt") }),
  s({trig = ">="}, { t("-ge") }),
  s({trig = "=>"}, { t("-ge") }),
  s({trig = "read", name = "read with prompt"}, {
	t("read -p \""), i(1, "prompt"), t("\" "), i(2, "variable"),
  }),
  as({trig = "|e", name = "Error handling"}, { t("|| { echo \""), i(1, "Error message"), t("\" ; exit 1; }") }),

  s({trig = "if", name = "If statement", dscr = "Bash if statement"}, fmt([=[
    if [[ {} ]]; then
        {}
    fi
    ]=], {
        i(1, "condition"),
        i(2, "# commands"),
    })),

  s({trig = "for", name = "For loop", dscr = "Bash for loop"}, fmt([[
    for {} in {}; do
        {}
    done
    ]], {
        i(1, "var"),
        i(2, "list"),
        i(3, "echo \"$var\""),
    })),
  s({trig = "while", name = "While loop", dscr = "Bash while loop"}, fmt([=[
    while [[ {} ]]; do
        {}
    done
    ]=], {
        i(1, "condition"),
        i(2, "# commands"),
    })),
  s({trig = "fn", name = "Function", dscr = "Bash function"}, fmt([[
    {}() {{
        {}
    }}
    ]], {
        i(1, "function_name"),
        i(2, "# commands"),
    })),

  s({trig = "case", name = "Case statement", dscr = "Bash case statement"}, fmt([[
    case {} in
        {})
            {}
            ;;
        *)
            {}
            ;;
    esac
]], {
        i(1, "variable"),
        i(2, "pattern1"),
        i(3, "# commands for pattern1"),
        i(4, "# default commands"),
    })),
  s({trig = "forr", name = "For range loop", dscr = "Bash for range loop"}, fmt([[
    for (( {} = {}; {} <= {}; {}++ )); do
        {}
    done
    ]], {
        i(1, "i"),
        i(2, "0"),
        i(3, "i"),
        i(4, "10"),
        i(5, "i"),
        i(6, "# commands"),
    })),
  s({trig = "select", name = "Select loop", dscr = "Bash select loop"}, fmt([[
    select {} in {}; do
        {}
    done
    ]], {
        i(1, "var"),
        i(2, "option1 option2 option3"),
        i(3, "# commands"),
    })),
  s({trig = "read", name = "Read input", dscr = "Read input from user"}, {
    t("read -p \""), i(1, "Prompt"), t("\" "), i(2, "variable"), i(0)
  }),
  s({trig = "array", name = "Array", dscr = "Declare an array"}, {
    t("declare -a "), i(1, "array_name"), t("=("),
    i(2, "\"element1\" \"element2\" ..."),
    t(")"), i(0)
  }),
  s({trig = "checkfile", name = "Check file", dscr = "Check if a file exists"}, {
    t("[[ -f "), i(1, "filename"), t(" ]] && "), i(2, "echo \"File exists\""), t(" || "), i(3, "echo \"File does not exist\""), i(0)
  }),
  s({trig = "checkdir", name = "Check directory", dscr = "Check if a directory exists"}, {
    t("[[ -d "), i(1, "dirname"), t(" ]] && "), i(2, "echo \"Directory exists\""), t(" || "), i(3, "echo \"Directory does not exist\""), i(0)
  }),
}
