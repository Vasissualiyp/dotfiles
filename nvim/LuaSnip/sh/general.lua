local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

return {
  as({trig = "#!", name = "Shebang", dscr = "Bash shebang line"}, { t("#!/usr/bin/env bash") }),
  s({trig = "if", name = "If statement", dscr = "Basic if-else statement"}, {
    t("if [ "), i(1, "condition"), t(" ]; then\n  "),
    i(2, "echo \"true\""),
    t("\nelse\n  "),
    i(3, "echo \"false\""),
    t("\nfi"), i(0)
  }),
  s({trig = "for", name = "For loop", dscr = "Basic for loop"}, {
    t("for "), i(1, "var"), t(" in "), i(2, "list"), t("; do\n  "),
    i(3, "echo \"$var\""),
    t("\ndone"), i(0)
  }),
  s({trig = "while", name = "While loop", dscr = "Basic while loop"}, {
    t("while [ "), i(1, "condition"), t(" ]; do\n  "),
    i(2, "echo \"looping\""),
    t("\ndone"), i(0)
  }),
  s({trig = "func", name = "Function", dscr = "Define a function"}, {
    t("function "), i(1, "name"), t("() {\n  "),
    i(2, "commands"),
    t("\n}"), i(0)
  }),
  s({trig = "case", name = "Case statement", dscr = "Basic case statement"}, {
    t("case "), i(1, "$variable"), t(" in\n  "),
    i(2, "pattern1"), t(")\n    "),
    i(3, "commands1"),
    t("\n    ;;\n  "),
    i(4, "pattern2"), t(")\n    "),
    i(5, "commands2"),
    t("\n    ;;\n  * )\n    "),
    i(6, "default commands"),
    t("\n    ;;\nesac"), i(0)
  }),
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
