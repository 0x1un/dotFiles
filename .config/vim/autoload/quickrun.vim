function! quickrun#execute(isfull)
  silent! wall
  let file_name = expand('%:t:r')
  let extension = expand('%:e')
  let runner = ""
  if extension == "js"
    let runner = "node"
  endif
  if extension == "ts"
    let runner = "ts-node"
  endif
  if extension == "rb"
    let runner = "ruby"
  endif
  if extension == "go"
    let runner = "go run"
  endif
  if extension == "py"
    let runner = "python"
  endif
  if extension == "swift"
    let runner = "swift"
  endif
  if extension == "c"
    let runner = "compile"
    let compiler = "gcc -g"
  endif
  if extension == "cc"
    let runner = "compile"
    let compiler = "gcc -g"
  endif
  if extension == "cpp"
    let runner = "compile"
    let compiler = "gcc -g"
  endif
  if extension == "hs"
    let runner = "compile"
    let compiler = "ghc"
  endif
  if extension == "rs"
    let runner = "compile"
    let compiler = "rustc"
  endif
  if runner == ""
    echoerr "File type not supported!"
  else
    if a:isfull == "true"
      if runner == "compile"
        execute "!term (".compiler." ".file_name.".".extension." -o ".file_name." && ./".file_name.")"
      else
        execute ":term ".runner." ".file_name.".".extension
      endif
    endif
    if a:isfull == "false"
      if runner == "compile"
        execute "!(".compiler." ".file_name.".".extension." -o ".file_name." && ./".file_name.")"
      else
        execute ":!".runner." ".file_name.".".extension
      endif
    endif
  endif
endfunction

command! QuickRunExecute call quickrun#execute("false")
command! QuickRunExecuteFullScreen call quickrun#execute("true")
