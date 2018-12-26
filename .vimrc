""""基本设置""""
set ai! " 关闭自动换行
set nohls " 不显示空格颜色
set smartindent
set shiftwidth=4
set expandtab
syntax on
set tabstop=4
set guifont=Monaco:18
set cindent
""""基本设置结束""""
"""备份设置""""
if has("vms")
    set nobackup
else
    set backup
endif
"""备份设置完成""""
""""插件安装""""
set nocompatible
" filetype off
filetype plugin indent on 

" 粘贴复制(系统剪贴板)映射
vnoremap <Leader>y "+y
nmap cp "+p

"""相对行号设置与绝对行号"""
set nu
augroup relative_number
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
augroup END

"""

""""高亮当前光标所在行列"""
set cursorline
autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg

set cursorcolumn
" autocmd InsertEnter * highlight CursorColumn ctermfg=Black ctermbg=Yellow cterm=bold guifg=Black guibg=yellow gui=bold
" autocmd InsertLeave * highlight CursorColumn ctermfg=Black ctermbg=Yellow cterm=bold guifg=Black guibg=yellow gui=NONE


""""""""""""""""""""""""""


""""一键运行"""
map <F4> :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w" 
    if &filetype == 'c' 
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!time python %'
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'go'
        :!time go run %
    endif                                                                              
endfunc 
""""一键运行结束"""
"""插件管理(检测)
let $BUNDLE = expand("$HOME/.dotfiles/data/vimdata/bundle")
let $PLUG_DIR = expand("$BUNDLE/vim-plug")

" if empty(glob(expand("$PLUG_DIR/plug.vim")))
  " silent !curl -fLo $PLUG_DIR/plug.vim --create-dirs
    " \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
" endif
" source $PLUG_DIR/plug.vim

call plug#begin(expand($BUNDLE))

" Plug 'https://github.com/hiberabyss/ProjectConfig'
" Plug 'VundleVim/Vundle.vim' "插件管理
Plug 'tenfyzhong/CompleteParameter.vim' "{'for': ['go', 'c', 'cpp', 'py', 'hs']}
Plug 'scrooloose/nerdtree' "目录树
Plug 'ctrlpvim/ctrlp.vim' "文件搜索
Plug 'wakatime/vim-wakatime' "记录使用情况
Plug 'luochen1990/rainbow' "彩虹括号
Plug 'docunext/closetag.vim' "符号补全
Plug 'flazz/vim-colorschemes' "配色
Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
" Plug 'godlygeek/tabular' "markdown所需插件
Plug 'plasticboy/vim-markdown', {'for': ['markdown']}"markdown所需插件
Plug 'iamcco/markdown-preview.vim', {'for': ['markdown']}   "markdown预览插件
Plug 'scrooloose/nerdcommenter'  "注释插件
Plug 'w0rp/ale'   "语法检查
Plug 'neovimhaskell/haskell-vim', {'for': ['hs', 'haskell']}
" Plugin 'alx741/haskellcomplete.vim'
Plug 'junegunn/vim-plug' "插件管理
Plug 'eagletmt/neco-ghc', {'for': ['hs', 'haskell']}
Plug 'fatih/vim-go', {'for': ['go', 'golang']}
Plug 'Valloric/YouCompleteMe'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/eleline.vim'
" Plugin 'itchyny/lightline.vim'
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
call plug#end() " Should run at last


" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" call vundle#end()
" This function are press pi & pu for install plugins and update plugins[通过快捷键安装或者更新]
filetype plugin indent on
function! GetPlugNameFronCurrentLine(cmd)
    let plugin_name = getline(".")

    if plugin_name !~ "^Plug"
        execute(a:cmd . '!')
        return
    endif

	let plugin_name = split(split(plugin_name, "'")[1], '/')[-1]
	let plugin_name = substitute(plugin_name, '\.git$', '', 'g')
	execute(a:cmd .' '. plugin_name)
endfunction

nmap ,pi :w<cr>:call GetPlugNameFronCurrentLine('PlugInstall')<cr>
nmap ,pu :call GetPlugNameFronCurrentLine('PlugUpdate')<cr>

" 手动加载插件, eg: :PlugLoad vim-go
function! s:plug_loaded(spec)
  let rtp = join(filter([a:spec.dir, get(a:spec, 'rtp', '')], 'len(v:val)'), '/')
  return stridx(&rtp, rtp) >= 0 && isdirectory(rtp)
endfunction

function! s:plug_names(...)
    return sort(filter(keys(filter(copy(g:plugs), { k, v -> !s:plug_loaded(v) })), 'stridx(v:val, a:1) != -1'))
endfunction

command! -nargs=+ -bar -complete=customlist,s:plug_names PlugLoad call plug#load([<f-args>])

""""插件安装结束""""


""" airline"""
" let g:airline_theme='sol'
""""""""""""""
"""eleline settings"""
set laststatus=2
" let g:eleline_slim = 1
""""""""""""""""""""""

""""目录树配置""""
map <F2> :NERDTreeToggle<CR> "F2打开/关闭目录树
"autocmd VimEnter * NERDTree "进入vim自动打开目录树
autocmd VimEnter * wincmd p "进入vim自动定位到编辑界面

" 是否显示隐藏文件
let NERDTreeShowHidden=0
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp','__pycache__','\.git$','\.DS_Store']
" NERDTree git 扩展
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


""""目录树配置结束""""

""""ctrlp文件搜索配置""""
let g:ctrlp_map = '<leader>p' "模糊搜索当前目录下所有文件
let g:ctrlp_cmd = 'CtrlP' 
map <leader>f :CtrlPMRU<CR> "模糊搜索最近打开的文件
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
"设置搜索框尺寸
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
"设置搜索框尺寸结束
""""ctrlp文件搜索配置结束""""

""""彩虹括号配置""""
let g:rainbow_active = 1
""""彩虹括号配置结束""""

""""colorscheme配色配置""""
colorscheme gruvbox
set background=dark
""""colorscheme配色配置结束""""

""""delimitMate符号补全设置""""
"au FileType python let b:delimitMate_nesting_quotes = ['"']
" 关闭某些类型文件的自动补全
"au FileType mail let b:delimitMate_autoclose = 0
""""delimitMate符号不全设置结束""""

"""""""auto-pairs符号配对设置""""""
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

"""""""auto-pairs符号配对设置结束""""""

"""""""nerdcommenter注释配置""""""
" 注释的时候自动加个空格
let g:NERDSpaceDelims=1
"""""""nerdcommenter注释配置结束""""""

"""""""ale语法检查配置""""""
" 显示侧边栏
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
" 自定义图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'normal'
"打开文件时不进行检查
let g:ale_lint_on_enter = 1
"""""""ale语法检查配置结束""""""""""


" /* for YCM */
if empty(glob('~/.vim/.ycm_extra_conf.py')) && !has('win32')
  silent !wget https://raw.githubusercontent.com/Karmenzind/dotfiles-and-scripts/master/home_k/.vim/.ycm_extra_conf.py
        \ -O ~/.dotfiles/data/vimdata/.ycm_extra_conf.py
endif

let g:ycm_filetype_blacklist = {
      \ 'gitcommit': 1,
      \ 'tagbar': 1,
      \ 'qf': 1,
      \ 'notes': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'mail': 1,
      \ }

set completeopt-=preview
set completeopt+=longest,menu
let g:ycm_add_preview_to_completeopt = 1 
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_global_ycm_extra_conf = '~/.dotfiles/data/vimdata/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_python_binary_path = 'python'
let g:ycm_goto_buffer_command = 'horizontal-split'


" YouCompleteMe settings
" 是否将注释中的内容添加到补全分析, 0为关闭
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"设置触发标识符补全的最小字符数，设置为99或更大的数字，则等效于关闭标识符补全功能，但保留语义补全功能
let g:ycm_min_num_of_chars_for_completion = 2

" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
map <C-G>  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"  fix .cpp error: ValueError: Still no compile flags, no completions yet.

let g:ycm_semantic_triggers = {
 \      'python': [ 're!(import\s+|from\s+(\w+\s+(import\s+(\w+,\s+)*)?)?)'  ],
 \      'haskell': ['.'] 
 \ }
let g:necoghc_enable_detailed_browse = 1

let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>

inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)


" let g:UltiSnipsExpandTrigger="<tab>"
" 使用 tab 切换下一个触发点，shit+tab 上一个触发点
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" 使用 UltiSnipsEdit 命令时垂直分割屏幕
" let g:UltiSnipsEditSplit="vertical"

""""Haskell 缩进控制"""
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords


"""vim-go configuretion
let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 1
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

"""Markdown-Preview settings"""
let g:mkdp_path_to_chrome = ""
    " 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）
    " 如果设置了该参数, g:mkdp_browserfunc 将被忽略

    let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
    " vim 回调函数, 参数为要打开的 url

    let g:mkdp_auto_start = 0
    " 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
    " markdown 文件的时候打开一次

    let g:mkdp_auto_open = 0
    " 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
    " 览窗口

    let g:mkdp_auto_close = 1
    " 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
    " 自动关闭预览窗口

    let g:mkdp_refresh_slow = 0
    " 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
    " 更新预览

    let g:mkdp_command_for_global = 0
    " 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown
    " 文件可以使用改命令

    let g:mkdp_open_to_the_world = 0
    " 设置为 1, 在使用的网络中的其他计算机也能访问预览页面
    " 默认只监听本地（127.0.0.1），其他计算机不能访问
nmap <silent> <F8> <Plug>MarkdownPreview        " 普通模式
imap <silent> <F8> <Plug>MarkdownPreview        " 插入模式
nmap <silent> <F9> <Plug>StopMarkdownPreview    " 普通模式
imap <silent> <F9> <Plug>StopMarkdownPreview    " 插入模式
"""""""""""""""
