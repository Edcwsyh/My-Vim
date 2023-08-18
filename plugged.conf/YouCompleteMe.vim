autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ycm_collect_identifiers_from_tags_files=1 "开启 YCM 基于标签引擎
let g:ycm_cache_omnifunc=0 "禁止缓存匹配项, 每次都重新生成匹配项
"提升不再是粉红色
"highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
"highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
let g:ycm_seed_identifiers_with_syntax=1    "开启语法分析
let g:ycm_key_invoke_completion = '<c-n>'   "语义补全快捷键
"let g:ycm_min_num_of_chars_for_completion=4 "开始补全的位数
let g:ycm_show_diagnostics_ui = 1 "开启诊断分析
set completeopt=menu,menuone,popup
let g:ycm_max_num_candidates = 20 "补全数量限制
let g:ycm_add_preview_to_completeopt = 0 "关闭函数原型窗口
let g:ycm_enable_diagnostic_signs = 1 "语法分析高亮
let g:ycm_error_symbol = '×' "错误提示
let g:ycm_warning_symbol = '⚠' "警告提示
let g:ycm_confirm_extra_conf=0 " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_max_diagnostics_to_display = 0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_disable_for_files_larger_than_kb=2000
let g:ycm_always_populate_location_list = 1
nmap <leader>D <plug>(YCMHover)
let g:ycm_auto_hover='' "禁用自动显示文档
"let g:ycm_server_use_vim_stdout = 1
"查看注释
map <F7> <plug>(YCMHover)
"跳转至引用
map <F8> :YcmCompleter GoToReferences<CR>
"跳转至包含文件
map <F9> :YcmCompleter GoToInclude<CR>
"跳转至定义
map <F10> :YcmCompleter GoToDefinition<CR>
"查看类型
map <F11> :YcmCompleter GetType<CR>
let g:ycm_server_log_level = 'debug'
"修复错误
map <F6> :YcmCompleter FixIt<CR>
"显示错误信息
map <C-F5> :YcmDiags<CR>
map <F5> :YcmShowDetailedDiagnostic<CR>
let g:ycm_filepath_whitelist = {
      \ 'c': 1,
      \ 'cpp': 1,
      \ 'hpp': 1,
      \ 'h': 1,
      \ 'java': 1,
      \ 'tmp': 1,
      \}
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{3}'],
			\ 'cs,lua,javascript': ['re!\w{3}'],
			\ }
let g:ycm_autoclose_quickfix = 0
let g:ycm_quickfix_max_height = 8


