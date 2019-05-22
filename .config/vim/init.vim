" 防止重复加载
if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif


let $CONFIG = expand('~/.dotfiles/data/vimdata/bundle')
if !isdirectory(expand($CONFIG))
	call mkdir(expand($CONFIG), 'p')
endif


" Load dein.
let s:dein_dir = finddir('dein.vim', '.;')
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
  if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
    let s:dein_dir = expand('$CONFIG/dein')
          \. '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      echomsg 'Download dein plugin management wait a moment'
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

let $VIMPATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
function! s:source_rc(path, ...) abort
  let use_global = get(a:000, 0, !has('vim_starting'))
  let abspath = resolve(expand($VIMPATH.'/vim/'. a:path))
  if !use_global
    execute 'source' fnameescape(abspath)
    return
  endif

  " substitute all 'set' to 'setglobal'
  let content = map(readfile(abspath),
        \ 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')
  " create tempfile and source the tempfile
  let tempfile = tempname()
  try
    call writefile(content, tempfile)
    execute 'source' fnameescape(tempfile)
  finally
    if filereadable(tempfile)
      call delete(tempfile)
    endif
  endtry
endfunction

call s:source_rc('dein/deinrc.vim')


let g:loaded_2html_plugin      = 1
let g:loaded_logiPat           = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
let g:loaded_man               = 1
let g:loaded_matchit           = 1
let g:loaded_matchparen        = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_rrhelper          = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_tarPlugin         = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_zipPlugin         = 1




" 取得本文件所在的目录
" let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 定义一个命令用来加载文件
" command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'

" 将 vim-init 目录加入 runtimepath
" exec 'set rtp+='.s:home

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
" set rtp+=~/.vim


"----------------------------------------------------------------------
" 模块加载, 虽然写法有点蠢, 但是便于启用/禁用操作
"----------------------------------------------------------------------

" 加载基础配置
" LoadScript init/init-basic.vim
"
" " 插件加载
" LoadScript init/init-plugins.vim
"
" LoadScript init/init-style.vim
"
" LoadScript init/auto-run.vim
"
" LoadScript init/keymaps.vim
"
" LoadScript init/init-tabsize.vim
"
" LoadScript plugins/vim-plug.vim
"
" LoadScript plugins/nerdTree.vim
"
" LoadScript plugins/md-prews.vim
"
" LoadScript plugins/set-title.vim
"
" LoadScript plugins/vim-ale.vim
"
" LoadScript plugins/vim-go.vim
"
" LoadScript plugins/startify.vim
"
" LoadScript plugins/coc-config.vim
"
" LoadScript plugins/nerdcommenter.vim
"
" LoadScript plugins/defx.vim
"
" LoadScript plugins/lightline.vim
"
" " LoadScript plugins/neosnippet.vim
"
" LoadScript plugins/translate.vim
"
" LoadScript plugins/indentline.vim
"
" LoadScript plugins/completeParameter.vim
"
" LoadScript plugins/rainbow.vim
"
" LoadScript plugins/auto-fcitx.vim

