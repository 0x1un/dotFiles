let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
	let path = expand(s:home . '/' . a:path)
	return substitute(path, '\\', '/', 'g')
endfunc



call plug#begin(get(g:, 'bundle_home', '~/.dotfiles/data/vimdata/bundle'))
" 目录插件
Plug	'scrooloose/nerdtree'

" 彩虹括号
Plug	'luochen1990/rainbow'

" 成对标签补全
Plug	'alvan/vim-closetag'

" vim主题
Plug	'morhetz/gruvbox'

" vim主题
Plug 	'altercation/vim-colors-solarized'

" 自动括号匹配
Plug 	'jiangmiao/auto-pairs'

" markdown 预览插件
Plug 	'iamcco/markdown-preview.vim', {'for': ['markdown']}

" 语句注释插件
Plug 	'scrooloose/nerdcommenter'

" 异步动态语法检查
Plug 	'w0rp/ale', {'for': ['go', 'python', 'c', 'rust', 'golang']}

" go语言支持
Plug 	'fatih/vim-go', {'for': ['go', 'golang']}

" 补全框架
Plug 	'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" 启动界面
Plug 	'mhinz/vim-startify'

" 运行
Plug 	'xuhdev/SingleCompile'

" Icons
Plug 	'ryanoasis/vim-devicons'

" tagbar
Plug 	'majutsushi/tagbar'

" i3 config
Plug 	'PotatoesMaster/i3-vim-syntax'
call plug#end()

