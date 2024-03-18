set number
set relativenumber
syntax on
set showcmd
set tabstop=4
"set spell
set autoindent
"set clipboard=unnamedplus
set background=dark
set encoding=utf-8
"set cursorline
"set cursorcolumn
"highlight CursorLine ctermbg=235 guibg=#2e3440
"highlight CursorColumn ctermbg=236 ctermfg=white guibg=#fe5260 guifg=black

" Special symbols {{{
digraph gu 287
" }}}

" Enable true color support
" set termguicolors

" More readable Highlighting colors (for instance, for folding)
hi Folded ctermbg=black ctermfg=cyan 

"set foldmethod=marker
set foldmethod=syntax
"set foldlevel=1

"Remap keys in normal mode with nnoremap (inoremap and vnoremap similarly for
"insert/visual mode)
"Example: inoremap jj <esc> - remap jj to the esc key in the insert mode

"if empty(v:servername) && exists('*remote_startserver')
"	call remote_startserver('VIM')
"endif

"VimWiki setup {{{
set nocompatible
filetype plugin on
syntax on
"let g:vimwiki_listsyms = '✗¼½¾✓'
let g:vimwiki_listsyms = '✗○◐●✓'

let wiki_1 = {}
let wiki_1.path  = '~/Documents/wiki/Research/'
let g:vimwiki_list = [wiki_1]

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end


" Zathura light+dark modes {{{
function! VimwikiLinkHandler(link)
  let link = a:link
  if link =~ '^zl:'
    let mode = 'light'
    let link = link[3:]
  elseif link =~ '^zd:'
    let mode = 'dark'
    let link = link[3:]
  else
    return 0
  endif
  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    if mode == 'light'
      execute '!zathura -c ~/.config/zathura/zathurarc-light ' . link
    else
      execute '!zathura ' . link
    endif
    return 1
  endif
endfunction

" }}}

"}}}
" Calendar Setup {{{
let g:calendar_monday = 1
"}}}

" Custom remappings
nnoremap <leader>nrn :set<Space>nonumber<Space>norelativenumber<Return>
nnoremap <leader>rn :set<Space>number<Space>relativenumber<Return>
inoremap <C-s> <Esc>:w<CR>a
" Clipboard copy-pasting
nnoremap gy "+y
nnoremap gY "+yy
nnoremap gp "+p
nnoremap gP "+P
vnoremap gy "+y
vnoremap gY "+yy
vnoremap gp "+p
vnoremap gP "+P
" Finding cursor 
nnoremap <leader>c :set<Space>cursorline<Space>cursorcolumn<Return>jk
nnoremap <leader>C :set<Space>nocursorline<Space>nocursorcolumn<Return>
" Noterius folds/unfolds
nnoremap <leader>zo ggjVGkkzo<Esc><Esc>gg
nnoremap <leader>zm ggjVGkkzm<Esc><Esc>gg
"Vimtex remappings
inoremap <M-I> <Esc>o<C-d>\item 
" Inkscape remappings
inoremap <C-`> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-`> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

"" Noterius mappings {{{
"" FindNextNote {{{
"function! FindNextNote()
"    let l:filepath = expand("%:p")
"    let l:dirs = split(l:filepath, "/")
"
"    let l:year = str2nr(l:dirs[-4])
"    let l:month = str2nr(l:dirs[-3])
"    let l:day = str2nr(l:dirs[-2])
"
"    " Construct the base directory path without the date parts
"    let l:basepath = join(l:dirs[0:-5], "/")
"
"    let l:found = 0
"    let l:max_iterations = 365  " One year as the maximum loop count
"
"    while l:found == 0 && l:max_iterations > 0
"        let l:day += 1
"
"        if l:day > 31 || (l:month == 2 && l:day > 29) || ((l:month == 4 || l:month == 6 || l:month == 9 || l:month == 11) && l:day > 30)
"            let l:day = 1
"            let l:month += 1
"        endif
"
"        if l:month > 12
"            let l:month = 1
"            let l:year += 1
"        endif
"
"	let l:newpath = "/" . l:basepath . "/" . printf("%04d", l:year) . "/" . printf("%02d", l:month) . "/" . printf("%02d", l:day) . "/notes.tex"
"
"	
"
"	let is_readable = filereadable(l:newpath)
"        if is_readable
"            let l:found = 1
"            execute "e " . l:newpath
"				    silent! execute "normal! ggjVGkkzo"
"        endif
"
"        let l:max_iterations -= 1
"    endwhile
"    " Debug statement
"    if l:max_iterations == 0
"        echom "No notes found for the next 365 days"
"    endif
"endfunction
""}}}
"
"" FindPreviousNote {{{
"function! FindPreviousNote()
"    let l:filepath = expand("%:p")
"    let l:dirs = split(l:filepath, "/")
"
"    let l:year = str2nr(l:dirs[-4])
"    let l:month = str2nr(l:dirs[-3])
"    let l:day = str2nr(l:dirs[-2])
"
"    " Construct the base directory path without the date parts
"    let l:basepath = join(l:dirs[0:-5], "/")
"
"    let l:found = 0
"    let l:max_iterations = 365  " One year as the maximum loop count
"
"    while l:found == 0 && l:max_iterations > 0
"        let l:day -= 1
"
"        " Check if we need to decrement the month
"        if l:day < 1
"            let l:month -= 1
"            if l:month == 2
"                let l:day = 28  " Assuming non-leap year for simplicity
"            elseif l:month == 4 || l:month == 6 || l:month == 9 || l:month == 11
"                let l:day = 30
"            else
"                let l:day = 31
"            endif
"        endif
"
"        " Check if we need to decrement the year
"        if l:month < 1
"            let l:month = 12
"            let l:year -= 1
"        endif
"
"        let l:newpath = "/" . l:basepath . "/" . printf("%04d", l:year) . "/" . printf("%02d", l:month) . "/" . printf("%02d", l:day) . "/notes.tex"
"
"        let is_readable = filereadable(l:newpath)
"        if is_readable
"            let l:found = 1
"            execute "e " . l:newpath
"				    silent! execute "normal! ggjVGkkzo"
"        endif
"
"        let l:max_iterations -= 1
"    endwhile
"endfunction
""}}}
"
"" OpenNoteOnDate {{{
"function! OpenNoteByDate()
"    " Prompt the user for input
"    let l:input = input('Enter date (YYYY-MM-DD) or day of the week (e.g., Mon, Tue, etc.), or press Enter for today: ')
"
"    " Define the base path of your notes, expanding the ~ to the home directory
"    let l:basepath = expand("~/research/notes")
"
"    " Check if the input is empty, and set to today's date if it is
"    if l:input == ''
"        let l:date = strftime('%Y-%m-%d')
"    else
"        " Define an associative array for days of the week
"        let l:daysOfWeek = {'sun': 0, 'mon': 1, 'tue': 2, 'wed': 3, 'thu': 4, 'fri': 5, 'sat': 6}
"        let l:dayInput = tolower(l:input)
"
"        " Check if input is a day of the week
"        if has_key(l:daysOfWeek, l:dayInput)
"            " Perform day of the week calculation
"            let l:currentDayOfWeek = strftime('%w')
"            let l:targetDayOfWeek = l:daysOfWeek[l:dayInput]
"            let l:dayDifference = l:currentDayOfWeek - l:targetDayOfWeek
"            if l:dayDifference < 0
"                let l:dayDifference += 7
"            endif
"
"            let l:secondsPerDay = 24 * 60 * 60
"            let l:targetTimestamp = localtime() - l:dayDifference * l:secondsPerDay
"            let l:date = strftime('%Y-%m-%d', l:targetTimestamp)
"
"        elseif l:input =~ '\v^\d{4}-\d{2}-\d{2}$'
"            " If input matches date format, use it directly
"            let l:date = l:input
"
"        else
"            echo "Invalid input. Please enter a valid date (YYYY-MM-DD) or day of the week (e.g., Mon, Tue, etc.)."
"            return
"        endif
"    endif
"
"    " Extract year, month, and day from the date
"    let l:year = matchstr(l:date, '\v^\d{4}')
"    let l:month = matchstr(l:date, '\v\d{2}', 5)
"    let l:day = matchstr(l:date, '\v\d{2}$')
"
"    " Construct the file path based on the input date
"    let l:newpath = l:basepath . "/" . l:year . "/" . l:month . "/" . l:day . "/notes.tex"
"
"    " Check if the file exists and is readable
"    if filereadable(l:newpath)
"        execute "edit " . l:newpath
"				silent! execute "normal! ggjVGkkzo"
"    else
"        echo "No note found for " . l:date
"    endif
"endfunction
"
""}}}
"
"" SearchNotes (NEED TO FIX) {{{
"function! SearchNotes()
"    let l:keyword = input('Enter search term: ')
"    let l:searchPattern = l:keyword . ' ~/research/notes/**/*.tex'
"    execute 'vimgrep /' . l:keyword . '/g ' . glob('~/research/notes/**/*.tex')
"    copen
"endfunction
""}}}

" Map the commands to the functions
nnoremap <leader>nn :FindNextNote<CR>
nnoremap <leader>np :FindPreviousNote<CR>
nnoremap <leader>no :OpenNoteByDate<CR>
nnoremap <leader>n? :DisplayNoteriusQuickhelp<CR>
"nnoremap <leader>no :call noterius#OpenNoteOnSpecificDay()<CR>
"nnoremap <leader>ns :call noterius#SearchNotes()<CR>

"}}}

"Neural Macros

function! InsertTerm() "{{{
  " Get the current datetime in the format of YYYYMMDDHHMMSS
  let datetime = strftime("%Y%m%d%H%M%S")

  normal! "ndd

  " Insert the label text
  execute "normal! a\\hyperref[term".datetime
  execute "normal! A]"

  " Add a new line
  "normal! o

  " Paste the contents of the system clipboard between braces
  execute "normal! a\{" . @n 
  execute "normal! kA}"

  "Get current positon of the cursor
  let current_pos = getpos('.')

  " Instert 3 lines at the end
  normal! zo
  normal! GkO
  normal! O

  "Put the title for explanation of the term
  execute "normal! o\\subsubsection*{" . @n 
  execute "normal! kA}"
  execute "normal! o\\label{term".datetime."}"

  "Add explanation
  call AddExplanation()
  "normal! zc

  "Move cursor to the next line after the starting position
  call setpos('.',current_pos)
  normal! o

endfunction

function! AddExplanation()
  normal! o
"  execute "normal! :Neural Using Latex if needed, explain to me " . @n
  execute "normal! a<Test>"
endfunction "}}}

nnoremap <leader>N :call InsertTerm()<CR>

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"PLUGINS {{{
call plug#begin() 
"Latex Folding
Plug 'matze/vim-tex-fold'

Plug 'Vasissualiyp/noterius-vim'

"Smooth scrolling
Plug 'psliwka/vim-smoothie'

"Scope highlighting
Plug 'junegunn/limelight.vim'

"Python folding
Plug 'tmhedberg/SimpylFold'

"Linting
"Plug 'dense-analysis/ale'

"Tmux navigator
Plug 'christoomey/vim-tmux-navigator'

"For displaying hex colors like this: #123abc #abcdef
Plug 'ap/vim-css-color'

"Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"VimWiki
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

"Colorschemes
Plug 'marcopaganini/mojave-vim-theme'
"Plug 'romannmk/ambiance-vim'
Plug 'equt/paper.vim'

"Bottom info line
Plug 'itchyny/lightline.vim'

"Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"GPT-3 API
Plug 'dense-analysis/neural'
    Plug 'muniftanjim/nui.nvim'
    Plug 'elpiloto/significant.nvim'

"Debugger
Plug 'puremourning/vimspector'
Plug 'davidhalter/jedi-vim'

"vimtex configuration
Plug 'lervag/vimtex'

"vim-signature
Plug 'https://github.com/kshenoy/vim-signature'

call plug#end() "}}}

"%{{{
"tex-fold Config
"let g:tex_fold_enabled=1
"let g:tex_fold_allow_marker = 1

"" Define a custom folding method for %begnote/%endnote blocks
"function! NoteFold(level)
"    let start = search('%begnote', 'n')
"    if start == 0
"        return -1
"    endif
"    let end = search('%endnote', 'n')
"    if end == 0
"        return -1
"    endif
"    if start > end
"        return -1
"    endif
"    let line = getline(start)
"    let foldstart = start + 1
"    if line =~ '{'
"        let foldstart = search('}', 'n')
"        if foldstart == 0 || foldstart > end
"            let foldstart = start + 1
"        else
"            let foldstart = foldstart + 1
"        endif
"    endif
"    let foldend = end - 1
"    return foldcreate(foldstart, foldend, a:level)
"endfunction
"
"" Define a command to fold all %begnote/%endnote blocks
"command! FoldNotes call setlocal('foldmethod', 'expr') | setlocal('foldexpr', 'NoteFold(v:foldlevel)')
"%}}}

"colorscheme mojave "{{{


"Color Schemes Test
"autocmd BufEnter * colorscheme default
"autocmd BufEnter *.tex colorscheme paper
"autocmd BufEnter *.py colorscheme mojave
"autocmd BufEnter *.txt colorscheme ambiance
"autocmd BufEnter *.md colorscheme ambiance
"autocmd BufEnter *.params colorscheme ambiance
"}}}

" Plugins configurations {{{

"LightLine
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

"Vim-Smoothie (smooth scrolling)
let g:smoothie_update_interval = 20
let g:smoothie_experimental_mappings = 1

""Linting with ale
"" Install python, c, cpp, bash autocompletion: sudo apt install flake8 mypy pylint gcc cppcheck shellcheck
"let g:ale_linters = {
"\   'python': ['flake8', 'mypy'],
"\   'c': ['gcc', 'cppcheck'],
"\   'sh': ['shellcheck'],
"\}
"" Change ALE error highlight to red text on a normal background
"highlight ALEError ctermbg=NONE ctermfg=Red guibg=NONE guifg=Red
"" Change ALE warning highlight to yellow text on a normal background
"highlight ALEWarning ctermbg=NONE ctermfg=Yellow guibg=NONE guifg=Yellow

"Limelight {{{
nmap <Leader>l <Plug>(Limelight)
"nmap <Leader>lf <Plug>(Limelight)i{
xmap <Leader>l <Plug>(Limelight)
nnoremap <leader>L :Limelight!<Return>

" Function to apply Limelight, modified to preserve cursor position
function! ApplyLimelight(timer_id)
  if g:LimelightActive
    " Save current cursor position
    let l:save_cursor = getpos('.')

    " Apply Limelight
    execute "normal! \<Plug>(Limelight)i{"

    " Restore cursor position
    call setpos('.', l:save_cursor)
  endif
endfunction

" Function to debounce cursor movement
function! DebounceCursorMovement()
  if exists('g:limelight_timer')
    call timer_stop(g:limelight_timer)
  endif
  let g:limelight_timer = timer_start(100, 'ApplyLimelight')
endfunction

" Function to toggle Limelight
let g:LimelightActive = 0
function! ToggleLimelight()
  if g:LimelightActive
    " Turn off Limelight
    Limelight! 0
    let g:LimelightActive = 0
    autocmd! LimelightAutoGroup
  else
    " Turn on Limelight
    let g:LimelightActive = 1
    call ApplyLimelight(0)
    " Set up an autocmd to call the debounce function on cursor movements
    augroup LimelightAutoGroup
      autocmd!
      autocmd CursorMoved,CursorMovedI * call DebounceCursorMovement()
    augroup END
  endif
endfunction

" Map lf to toggle the Limelight function
nnoremap <silent> <Leader>lf :call ToggleLimelight()<CR>
"
""--------------------------------------------------------------------------------
""MAPPINGS{{{
""--------------------------------------------------------------------------------
"" limelight works on ranges. Declare limelight to bein on content of current line
"nnoremap <space>lb :let g:limelight_bop='^'.getline('.').'$'<cr>
"" limelight works on ranges. Declare limelight to end on contents of current line
"nnoremap <space>le :let g:limelight_eop='^'.getline('.').'$'<cr>
""decrement
"nnoremap <space>ld :call SetLimeLightIndent(g:limelightindent - 4)<cr>
""increment
"nnoremap <space>li :call SetLimeLightIndent(g:limelightindent + 4)<cr>
""reset indent to default 4
"nnoremap <space>lr :call SetLimeLightIndent(4)<cr>
"" set limelight toggle
"noremap <space>ls :call SetLimeLightIndent(8)
"nnoremap <space>lt :Limelight!!<cr>
"
""-----------------------------------------------------------------------------}}}
""FUNCTIONS{{{
""--------------------------------------------------------------------------------
"let g:limelightindent=4
"function! LimeLightExtremeties()
"    let limelight_start_stop='^\s\{0,'.g:limelightindent.'\}\S'
"    let g:limelight_eop=limelight_start_stop
"    let g:limelight_bop=limelight_start_stop
"    Limelight!!
"    Limelight!!
"    echo 'limelightindent = '.g:limelightindent
"endfunction
"function! SetLimeLightIndent(count)
"    let g:limelightindent = a:count
"    if(g:limelightindent < 0)
"        g:limelightindent = 0
"    endif
"    call LimeLightExtremeties()
"endfunction
""-----------------------------------------------------------------------------}}}
"command! -nargs=*  SetLimeLightIndent call SetLimeLightIndent(<args>)

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
"}}}

"SimpylFold
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0

"UltiSnips Setup
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-d>"

"Vimtex settings
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode = 0
let g:tex_flavor = 'latex'
"Continuous latex compilation
set conceallevel=1
"Set .tex foldmethod to marker
autocmd FileType tex setlocal foldmethod=marker 


" Configure Neural like so in Vimscript
let g:neural = {
\   'source': {
\       'openai': {
\           'api_key': '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',
\       },
\   },
\}

"}}}

" Disable the background color in Vim for transparency
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE 

""""""""""""""""""""""""""""vimtex settings"""""""""""""""""""""""""""""
if executable('latex')
  " Hacks for inverse search to work semi-automatically,
  " see https://jdhao.github.io/2021/02/20/inverse_search_setup_neovim_vimtex/.
  function! s:write_server_name() abort
    let nvim_server_file = (has('win32') ? $TEMP : '/tmp') . '/vimtexserver.txt'
    call writefile([v:servername], nvim_server_file)
  endfunction

  augroup vimtex_common
    autocmd!
    autocmd FileType tex call s:write_server_name()
    autocmd FileType tex nmap <buffer> <F9> <plug>(vimtex-compile)
  augroup END

  let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : 'build',
    		\ 'continuous': 1,
        \ }

  " TOC settings
  let g:vimtex_toc_config = {
        \ 'name' : 'TOC',
        \ 'layers' : ['content', 'todo', 'include'],
        \ 'resize' : 1,
        \ 'split_width' : 30,
        \ 'todo_sorted' : 0,
        \ 'show_help' : 1,
        \ 'show_numbers' : 1,
        \ 'mode' : 2,
        \ }

"The following code is adapted from https://gist.github.com/skulumani/7ea00478c63193a832a6d3f2e661a536.
    function! UpdateSkim() abort
      let l:out = b:vimtex.out()
      let l:src_file_path = expand('%:p')
      let l:cmd = [g:vimtex_view_general_viewer, '-r']

      if !empty(system('pgrep Skim'))
        call extend(l:cmd, ['-g'])
      endif

      call jobstart(l:cmd + [line('.'), l:out, l:src_file_path])
    endfunction
  "endif
endif
