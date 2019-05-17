scriptencoding utf-8

" ale {
let g:ale_set_highlights = 0
let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

let g:ale_sign_error = '•●'
let g:ale_sign_warning = '●•'
let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'

let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

" }
" syntastic {
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_javascript_checkers=['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
let g:syntastic_error_symbol='✹'
let g:syntastic_warning_symbol='✴'
let g:syntastic_aggregate_errors=1

" }
let g:ale_lintetrs = {
	  \ 'go': ['golint', 'go vet', 'go build'],
	  \'javascript': ['eslint', 'stylelint'],
	  \'jsx': ['eslint', 'stylelint'],
	  \'less': ['prettier'],
	  \'python': ['flake8', 'pylint'],
	  \ }

