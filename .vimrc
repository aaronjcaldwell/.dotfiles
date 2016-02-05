"----------------------------------------------------------------------------------
"  important
"----------------------------------------------------------------------------------

source ~/.vimrc_local
"Contains:
" * pathogen infect
" * color
" * terminal settings
" * tmuxline
" * airline settings

"----------------------------------------------------------------------------------
"  moving around, searching and patterns
"----------------------------------------------------------------------------------

set hlsearch
nnoremap <CR> :noh<CR><CR>
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"-------The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects
  "       .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap ? :Ag<SPACE>
" Close quickfix
autocmd FileType qf nmap <silent> <buffer> <cr> <cr>:ccl<cr>

"----------------------------------------------------------------------------------
"  tags
"----------------------------------------------------------------------------------

"----------------------------------------------------------------------------------
"  displaying text
"----------------------------------------------------------------------------------

set encoding=utf-8

"----------------------------------------------------------------------------------
"  syntax, highlighting and spelling
"----------------------------------------------------------------------------------
" General autocomplete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" open omni completion menu closing previous if open and opening new menu
" without changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
  \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu
" without changing the text
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
  \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>' "

syntax on
filetype plugin indent on

autocmd BufEnter * :syntax sync fromstart

"-------Eclim code completion
let g:EclimCompletionMethod = 'omnifunc'
inoremap fd <C-X><C-O>

"-------UltiSnips
set runtimepath+=~/.vim/my_snippets
set runtimepath+=~/.vim/my_snippets/angular-vim-snippets
" Trigger configuration. Do not use <tab> if you use
let g:UltiSnipsExpandTrigger="<C-j>"                                                 
let g:UltiSnipsJumpForwardTrigger="<C-l>"                                            
let g:UltiSnipsJumpBackwardTrigger="<C-h>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=['UltiSnips','html','javascript']

"-------Syntastic
"let g:syntastic_javascript_jshint_exec='/home/aaron/.npm-packages/bin/jshint'
"let g:syntastic_html_jshint_exec='/home/aaron/.npm-packages/bin/jshint'
let g:syntastic_html_checkers = ['jshint', 'validator', 'w3']
let g:syntastic_mode_map = { "mode": "active",
      \ "active_filetypes": ["html", "js", "gsp"],
      \ "passive_filetypes": ["puppet"] }
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_enable_balloons = 1
let g:syntastic_filetype_map = { "gsp": "html"}

"----------------------------------------------------------------------------------
"  multiple windows
"----------------------------------------------------------------------------------

"----------------------------------------------------------------------------------
"  multiple tab pages
"----------------------------------------------------------------------------------

nnoremap <C-i> :bp<cr>
nnoremap <C-o> :bn<cr>
nnoremap <C-x> :bd<cr>  

"----------------------------------------------------------------------------------
"  terminal
"----------------------------------------------------------------------------------
" see local file

"----------------------------------------------------------------------------------
"  using the mouse
"----------------------------------------------------------------------------------

"----------------------------------------------------------------------------------
"  printing
"----------------------------------------------------------------------------------

"----------------------------------------------------------------------------------
"  messages and info
"----------------------------------------------------------------------------------

"----------------------------------------------------------------------------------
"  selecting text
"----------------------------------------------------------------------------------

"----------------------------------------------------------------------------------
"  editing text
"----------------------------------------------------------------------------------

set smartcase
let g:multi_cursor_quit_key='<C-m>'
set nowrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
hi ColorColumn guibg=#2d2d2d ctermbg=246
let &colorcolumn=join(range(81,999),",")
set hidden
set backspace=indent,eol,start

"----------------------------------------------------------------------------------
"  tabs and indenting
"----------------------------------------------------------------------------------

set tabstop=2
set shiftwidth=2
set expandtab
let g:indentLine_color_term = "grey" 
set smartindent

"-----Vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"----------------------------------------------------------------------------------
"  folding
"----------------------------------------------------------------------------------

set fillchars+=stl:\ ,stlnc:\

"----------------------------------------------------------------------------------
"  diff mode
"----------------------------------------------------------------------------------

"-------Color settings
if &diff
  colorscheme github
endif

"----VimDiff settings
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

"----------------------------------------------------------------------------------
"  mapping
"----------------------------------------------------------------------------------

inoremap jk <esc>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"----------------------------------------------------------------------------------
"  reading and writing files
"----------------------------------------------------------------------------------

"----------------------------------------------------------------------------------
"  the swap file
"----------------------------------------------------------------------------------

set nobackup
set noswapfile

"----------------------------------------------------------------------------------
"  command line editing
"----------------------------------------------------------------------------------

"----------------------------------------------------------------------------------
"  executing external commands
"----------------------------------------------------------------------------------

"----------------------------------------------------------------------------------
"  running make and jumping to errors
"----------------------------------------------------------------------------------

"----------------------------------------------------------------------------------
"  language specific
"----------------------------------------------------------------------------------

let javascript_enable_domhtmlcss=1
let b:javascript_fold=1
let g:javascript_conceal=1
let g:javascript_ignore_javaScriptdoc=1
let g:used_javascript_libs='angularjs,angularui,jasmine'

"----------------------------------------------------------------------------------
"  multi-byte characters
"----------------------------------------------------------------------------------

"----------------------------------------------------------------------------------
"  various
"----------------------------------------------------------------------------------

set nu

"-------NerdTree---------------------------
map <C-a> :NERDTreeToggle<CR>
:hi Directory guifg=#FF0000 ctermfg=red

"-----Fugitive settings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

"----------------------------------------------------------------------------------

