set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

"补全插件
Plug 'ycm-core/YouCompleteMe' 
"Plug 'skywind3000/vim-auto-popmenu'
Plug 'luochen1990/rainbow'
"文件树插件
Plug 'preservim/nerdtree'
"注释插件
Plug 'babaybus/DoxygenToolkit.vim' 
"括号补全插件
Plug 'jiangmiao/auto-pairs'
"函数原型插件
Plug 'Shougo/echodoc.vim'
"tag生成插件
"Plug 'ludovicchabant/vim-gutentags'
"符号查看插件
Plug 'Yggdroot/LeaderF'
"语法高亮插件
Plug 'octol/vim-cpp-enhanced-highlight'
"缩进显示插件
Plug 'Yggdroot/indentLine'
call plug#end()

"YouCompleteMe
source ~/.vim/plugged.conf/YouCompleteMe.vim

"nerdTree
source ~/.vim/plugged.conf/NerdTree.vim

"rainbow
source ~/.vim/plugged.conf/rainbow.vim

"auto-pairs
source ~/.vim/plugged.conf/auto-pairs.vim

"DoxygenToolkit
source ~/.vim/plugged.conf/DoxygenToolkit.vim

"gutentags
"source ~/.vim/plugged.conf/gutentags.vim

"LeaderF
map <F3> :LeaderfFunction!<CR>

"echodoc.vim
set cmdheight=2
let g:echodoc#enable_at_startup=1
"indentLine

"myscript 自编写脚本
source ~/.vim/myscript/manager.vim

set cursorcolumn "突出显示当前列
set cursorline "突出显示当前行
set ambw=double "将所有字符显示为全角宽度
colorschem slate "设置配色为slate
set number "开启行号
set nocompatible "关闭对vi的兼容
syntax enable "开启语法高亮
syntax on "针对所有缓冲区中的文件开启语法高亮
set encoding=utf-8 "设置编码格式
set fileencoding=utf-8 "设置文件编码格式
"set autoindent "设置自动缩进
set expandtab "将tab映射为空格
set softtabstop=4 "tab宽度为4个空格
set shiftwidth=4 "缩进为4个空格 
set tabstop=4 "tab宽度为4个空格(不转换为空格时)
"set textwidth=80 "单行代码最大长度
set showmatch "输入)}时匹配({
set hlsearch "搜索高亮
set autochdir "自动切换目录
set autoread "自动读取外部文件修改
set autowriteall "切换文件时自动保存
set updatetime=5000 "每5秒保存一次swap文件
set wildmenu "vim命令自动补全
set backspace=indent,eol,start "退格键可以删除文本
set foldenable "启用折叠
set incsearch "输入搜索内容时就显示搜索结果"
"set wildmode=longest:list,full
"
"按键映射
"imap [ []<LEFT>
"imap ( ()<LEFT>
"inoremap {} {}<Esc>i
"inoremap " ""<ESC>i
"inoremap ' ''<ESC>i
inoremap <> <><ESC>i
"imap {<CR> {<CR>}<Esc>O
imap , , 
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
"set tags+=/home/edcwsyh/local_develop/china_develop/src/zone/.tags

"高亮配置
highlight PMenu ctermfg=11 ctermbg=236 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=226 ctermbg=232 guifg=black guibg=darkgrey
highlight Search term=reverse ctermfg=232 ctermbg=226 guifg=wheat guibg=peru

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py,*hpp exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else 
        call setline(1, "/*") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: Edcwsyh") 
        call append(line(".")+2, "    > Mail: const.nullPointer@gmail.com") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, "*/") 
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
	    call append(line(".")+6, "")
    endif
    if &filetype == 'c'
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef __".toupper(expand("%:r"))."_EDC__")
        call append(line(".")+7, "#define __".toupper(expand("%:r"))."_EDC__")
        call append(line(".")+8, "#endif")
	  call append(line(".")+9, "")
    endif
    if expand("%:e") == 'hpp'
        call append(line(".")+6, "#ifndef __".toupper(expand("%:r"))."_EDC__")
        call append(line(".")+7, "#define __".toupper(expand("%:r"))."_EDC__")
        call append(line(".")+8, "")
        call append(line(".")+9, "namespace {")
        call append(line(".")+10, "")
        call append(line(".")+11, "}")
        call append(line(".")+12, "")
        call append(line(".")+13, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal 8G
