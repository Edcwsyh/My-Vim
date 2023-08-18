" vimscript
"> File Name : Leaderf.vim
"> Author : Edcwsyh
"> Create time : 2023年08月15日 星期二 22时33分51秒

map <F3> :LeaderfFunction<CR>
map <F2> :LeaderfFile ./<CR>
map <leader>f :LeaderfFile<CR>
map <leader>` :LeaderfFile ~<CR>
map <leader>r :LeaderfMru<CR>
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_CursorBlink = 1
let g:Lf_NumberOfCache = 10
let g:Lf_PopupColorscheme = "gruvbox_material"
"索引时是否访问链接文件指向的目录
let g:Lf_FollowLinks = 1
let g:Lf_WildIgnore = {
        \ 'dir': ["build", "build.mk", "run_*", "CMakeFiles", '.svn', '.git', '.hg'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
        \}
let g:Lf_MruWildIgnore = {
        \ 'dir': ["build", "build.mk", "run_*", "CMakeFiles", '.svn', '.git', '.hg'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
        \}

let g:Lf_CtagsFuncOpts = {
        \ 'cpp' : '--c++-kinds=fpmvc', 
        \ 'c': '--c-kinds=fp',
        \ 'rust': '--rust-kinds=f',
        \ }
