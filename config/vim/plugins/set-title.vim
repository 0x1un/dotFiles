"""自动添加作者注释
autocmd BufNewFile *.sh,*.py,*.lua exec ":call SetTitle()"                                                                                       
"定义函数SetTitle，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*lua,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    if &filetype == 'lua'
        call setline(line(".")+0, "#!/usr/bin/env lua")
        call setline(line(".")+1, "--------")
        call setline(line(".")+2, "-- Author: 0x1un")
        call setline(line(".")+3, "-- CreteDate: ".strftime("%c"))
        call setline(line(".")+4, "--------")
    endif

    if &filetype == 'py'
        call setline(line(".")+0, "#!/usr/bin/env python3")
        call setline(line(".")+1, "# Author: 0x1un")
        call setline(line(".")+2, "# CreteDate: ".strftime("%c"))
    endif

    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 
