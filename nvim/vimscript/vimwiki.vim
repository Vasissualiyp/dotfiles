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
