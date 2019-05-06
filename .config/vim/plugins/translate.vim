nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV

nmap <silent> <Leader>t <Plug>Translate
vmap <silent> <Leader>t <Plug>TranslateV


hi vtmTitle       term=None ctermfg=135 guifg=#AE81FF cterm=bold    gui=bold
hi vtmQuery       term=None ctermfg=161 guifg=#F92672 cterm=bold    gui=bold
hi vtmTrans       term=None ctermfg=118 guifg=#A6E22E cterm=bold    gui=bold
hi vtmPhonetic    term=None ctermfg=193 guifg=#C4BE89 cterm=italic  gui=italic
hi vtmExplain     term=None ctermfg=144 guifg=#00FFFF
hi vtmProperty    term=None ctermfg=161 guifg=#FF00FF cterm=bold    gui=bold
" 这一选项决定了窗口整体的前景色和背景色
hi vtmPopupNormal term=None ctermfg=255 ctermbg=234   guibg=#303030 guifg=#EEEEEE
