let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
	let path = expand(s:home . '/' . a:path)
	return substitute(path, '\\', '/', 'g')
endfunc



call plug#begin(get(g:, 'bundle_home', '~/.dotfiles/data/vimdata/bundle')) 
" 目录插件 
Plug 	'scrooloose/nerdtree'

" 彩虹括号
Plug	'luochen1990/rainbow'

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

" 文件图标
Plug 	'ryanoasis/vim-devicons'

" tagbar 查看函数属性
Plug 	'majutsushi/tagbar'

" 高亮i3配置文件
Plug 	'PotatoesMaster/i3-vim-syntax'

" 文件目录管理工具
Plug 	'Shougo/defx.nvim'

" defx的文件图标
Plug 	'kristijanhusak/defx-icons'

" lightline状态栏
Plug 	'itchyny/lightline.vim'

" lightline顶部buffer
Plug 	'mengelbrecht/lightline-bufferline'

" lightline 主题
Plug 	'yarisgutierrez/ayu-lightline'

" lightline主题
Plug 	'taigacute/spaceline.vim'

" 代码片段补全
" Plug 	'Shougo/neosnippet.vim'
" Plug 	'Shougo/neosnippet-snippets'

" 符号补全
Plug 	'Raimondi/delimitMate'
Plug 	'SirVer/ultisnips'

" 文件模糊搜索
Plug 	'Yggdroot/LeaderF', { 'do': './install.sh' }

" 缩进线
Plug 	'Yggdroot/indentLine'

" fish脚本高亮
Plug	'dag/vim-fish', {'for': 'fish'}

" 翻译插件
Plug	'voldikss/vim-translate-me'

" 参数补全
Plug	'tenfyzhong/CompleteParameter.vim'

" 批量选择
Plug	'terryma/vim-multiple-cursors'

" 类似tagbar的插件
Plug	'liuchengxu/vista.vim'
call plug#end()

