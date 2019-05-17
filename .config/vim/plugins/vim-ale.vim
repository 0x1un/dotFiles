let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0

let g:ale_lintetrs = {
      \ 'go': ['golint', 'go vet', 'go build'],
      \'javascript': ['eslint', 'stylelint'],
      \'jsx': ['eslint', 'stylelint'],
      \'less': ['prettier'],
      \ }
