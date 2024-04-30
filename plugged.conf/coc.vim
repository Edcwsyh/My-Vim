" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


command! -nargs=* -range CocFix :call CocActionAsync('codeActionRange', <line1>, <line2>, 'quickfix')
map <F5> :CocDiagnostics<CR>
map <F6> :CocFix<CR>
map <F8> :call CocAction('jumpUsed')<CR>
map <F10> :call CocAction('jumpDefinition', 'drop')<CR>
map <C-F10> :call CocAction('jumpImplementation')', 'drop')<CR>
nmap <leader>t <Plug>(coc-rename)
nmap <leader>[ :call CocAction('diagnosticNext')<CR>
nmap <leader>] :call CocAction('diagnosticPrevious')<CR>
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

map <F7> :call ShowDocumentation()<CR>
