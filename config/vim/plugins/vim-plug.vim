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

