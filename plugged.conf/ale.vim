" vimscript
"> File Name : ale.vim
"> Author : Edcwsyh
"> Create time : 2024年03月13日 星期三 14时25分20秒
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_linters = {
\   'cpp': ['clangtidy'],
\   'c': ['clangtidy'],
\   'cc': ['clangtidy'],
\}
let g:ale_fixers={
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_enabled=0
let g:ale_cpp_clangtidy_checks = []
let g:ale_cpp_clangtidy_executable = '/home/edcwsyh/software/llvm/bin/clang-tidy'
let g:ale_c_parse_compile_commands=1
let g:ale_cpp_clangtidy_extra_options = ''
let g:ale_cpp_clangtidy_options = ''
let g:ale_set_balloons=1
let g:ale_linters_explicit=1
let g:airline#extensions#ale#enabled=1
let g:ale_virtualtext_cursor=2
let g:ale_set_signs=1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save=1

"map <C-[> :ALEEnable<CR>
"map <C-]> :ALEDisable<CR>
