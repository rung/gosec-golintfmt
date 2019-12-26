" Fully influenced by golint
if exists("b:did_ftplugin_go_gosec")
    finish
endif

if !executable("gosec")
    finish
endif

command! -buffer Gosec call s:Gosec()

function! s:Gosec() abort
    cexpr system('gosec -quiet -fmt golint ' . shellescape(expand('%:h')))
endfunction

let b:did_ftplugin_go_gosec = 1

" vim:ts=4:sw=4:et
