imap <silent><expr><TAB>
\ pumvisible() ? "\<Down>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)":
 \ <SID>check_back_space() ? "\<TAB>":
 \ coc#refresh()

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

inoremap <silent><expr> <leader-space> coc#refresh()

imap <expr><S-Tab> pumvisible() ? "\<C-p>" : "<Plug>delimitMateS-Tab"
imap <expr><CR>
            \ pumvisible() ? "\<c-y>" :
            \ delimitMate#WithinEmptyPair() ? "\<C-R>=delimitMate#ExpandReturn()\<CR>" : "\<CR>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'

let g:neosnippet#snippets_directory='~/.config/vim/snippets/'
