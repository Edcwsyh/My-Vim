set nocompatible              " be iMproved, required
filetype off                  " required

"先设置好编码格式
set encoding=utf-8 "设置编码格式
set fileencoding=utf-8 "设置文件编码格式
set fileencodings=utf-8,gbk "设置文件编码格式

" value define 开启的补全插件
" 0 : empty
" 1 : YouComplete
" 2 : Coc.nvim
let g:enable_complete_plug=1

call plug#begin('~/.vim/plugged')

"补全插件
if g:enable_complete_plug==1
    Plug 'Edcwsyh/YouCompleteMe' 
    source ~/.vim/plugged.conf/YouCompleteMe.vim
elseif g:enable_complete_plug==2
    Plug 'neoclide/coc.nvim',  {'branch': 'release'}
    source ~/.vim/plugged.conf/coc.vim
endif

"括号高亮
Plug 'luochen1990/rainbow'
source ~/.vim/plugged.conf/rainbow.vim

"配色插件
Plug 'morhetz/gruvbox'

"注释插件
Plug 'babaybus/DoxygenToolkit.vim' 
source ~/.vim/plugged.conf/DoxygenToolkit.vim

"括号补全插件
Plug 'jiangmiao/auto-pairs'
source ~/.vim/plugged.conf/auto-pairs.vim

"符号查看插件
Plug 'Yggdroot/LeaderF',  { 'do': ':LeaderfInstallCExtension'  }
source ~/.vim/plugged.conf/Leaderf.vim

"语法高亮插件
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'bfrg/vim-cpp-modern'

"缩进显示插件
Plug 'Yggdroot/indentLine'
source ~/.vim/plugged.conf/indentLine.vim

" 生成函数定义插件
Plug 'Edcwsyh/vim-gencode-cpp'
source ~/.vim/plugged.conf/vim-cpp-modern.vim

" cpp文件跳转插件
Plug 'vim-scripts/a.vim'
"copilot
"Plug 'github/copilot.vim'
"svnj.vim
Plug 'juneedahamed/svnj.vim'
"airvim
Plug 'vim-airline/vim-airline'
source ~/.vim/plugged.conf/airline.vim
"ale
Plug 'dense-analysis/ale'
source ~/.vim/plugged.conf/ale.vim

"ai
"Plug 'madox2/vim-ai'
"Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
call plug#end()

set cursorcolumn "突出显示当前列
set cursorline "突出显示当前行
set ambw=double "将所有字符显示为全角宽度

" diff neovim
if has('nvim')
    colorschem desert "设置配色为desert
else
    autocmd vimenter * ++nested colorscheme gruvbox
    set bg=dark
    "colorschem murphy "设置配色为slate
endif

set number "开启行号
set nocompatible "关闭对vi的兼容
syntax enable "开启语法高亮
syntax on "针对所有缓冲区中的文件开启语法高亮
"set autoindent "设置自动缩进
set list lcs=tab:\|.
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
set scrolloff=20 "距离行首行尾多少行时自动滚屏
"set switchbuf+=usetab,newtab "切换选项
"set wildmode=longest:list,full
"
"按键映射
inoremap <> <><ESC>i
imap , , 
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
noremap K 3<Up>
noremap J 3<Down>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nmap zv= :vertical resize +5<CR>
nmap zv- :vertical resize -5<CR>
nmap zs= :resize +5<CR>
nmap zs- :resize -5<CR>

"高亮配置
highlight PMenu ctermfg=11 ctermbg=236 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=226 ctermbg=232 guifg=black guibg=darkgrey
highlight Search term=reverse ctermfg=232 ctermbg=226 guifg=wheat guibg=peru

if &term =~ "screen-256color"
    " SecureCRT versions prior to 6.1.x do not support 4-digit DECSET
    "    let &t_ti = "\<Esc>[?1049h"
    "    let &t_te = "\<Esc>[?1049l"
    " Use 2-digit DECSET instead
    let &t_ti = "\<Esc>[?47h"
    let &t_te = "\<Esc>[?47l"
endif

"myscript 自编写脚本
source ~/.vim/myscript/manager.vim
