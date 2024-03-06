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
