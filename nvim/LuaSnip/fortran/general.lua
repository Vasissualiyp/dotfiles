local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s({trig = "program", name = "Program Template", dscr = "Program template"}, 
    fmt([[
    program {}
      implicit none
      {}
    end program {}
    ]], 
      { i(1, "program_name"), i(2, "! code"), rep(1) }
    )
  ),

  s({trig = "subroutine", name = "Subroutine", dscr = "Subroutine template"}, 
    fmt([[
    subroutine {}({})
      implicit none
      {}
    end subroutine {}
    ]], 
      { i(1, "subroutine_name"), i(2, "arguments"), i(3, "! code"), rep(1) }
    )
  ),

  s({trig = "function", name = "Function", dscr = "Function template"}, 
    fmt([[
    function {}({}) result({})
      implicit none
      {}
    end function {}
    ]], 
      { i(1, "function_name"), i(2, "arguments"), i(3, "result_name"), i(4, "! code"), rep(1) }
    )
  ),

  s({trig = "module", name = "Module", dscr = "Module template"}, 
    fmt([[
    module {}
      implicit none
      {}
    end module {}
    ]], 
      { i(1, "module_name"), i(2, "! code"), rep(1) }
    )
  ),

  s({trig = "use", name = "Use Module", dscr = "Use a module"}, 
    fmt('use {}', 
      { i(1, "module_name") }
    )
  ),

  s({trig = "print", name = "Print", dscr = "Print statement"}, 
    fmt('print *, "{}"', 
      { i(1, "message") }
    )
  ),

  s({trig = "do", name = "Do Loop", dscr = "Do loop"}, 
    fmt([[
    do {} = {}, {}
      {}
    end do
    ]], 
      { i(1, "i"), i(2, "start"), i(3, "end"), i(4, "! code") }
    )
  ),

  s({trig = "if", name = "If Statement", dscr = "If statement"}, 
    fmt([[
    if ({}) then
      {}
    endif
    ]], 
      { i(1, "condition"), i(2, "! code") }
    )
  ),
}
