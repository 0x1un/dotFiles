" 防止重复加载
if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'

" 将 vim-init 目录加入 runtimepath
exec 'set rtp+='.s:home

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=~/.vim


"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------

" 加载基础配置
LoadScript init/init-basic.vim

" 插件加载
LoadScript init/init-plugins.vim

LoadScript init/init-style.vim

LoadScript init/auto-run.vim

LoadScript init/keymaps.vim

LoadScript init/init-tabsize.vim

LoadScript plugins/vim-plug.vim

LoadScript plugins/nerdTree.vim

LoadScript plugins/md-prews.vim

LoadScript plugins/set-title.vim

LoadScript plugins/vim-ale.vim

LoadScript plugins/vim-go.vim

LoadScript plugins/startify.vim

LoadScript plugins/coc-config.vim

LoadScript plugins/nerdcommenter.vim

LoadScript plugins/defx.vim

LoadScript plugins/lightline.vim

" LoadScript plugins/neosnippet.vim

LoadScript plugins/indentline.vim
