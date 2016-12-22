"----------------------------------------------------------------------------------
"  important
"----------------------------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/ocp-indent-vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/ag'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'Yggdroot/indentLine'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'burnettk/vim-angular'
Plugin 'Townk/vim-autoclose'
Plugin 'flazz/vim-colorschemes'
Plugin 'junegunn/vim-easy-align'
Plugin 'vim-scripts/EasyMotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-rooter'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ervandew/supertab'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim' "make
Plugin 'Quramy/tsuquyomi'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'lambdalisue/vim-unified-diff'
Plugin 'ap/vim-css-color'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"---------------------------------------------------------------------------------
"  syntax, highlighting and spelling
"---------------------------------------------------------------------------------

"----------------------------------------------------------------------------------
"  terminal
"----------------------------------------------------------------------------------

"set t_Co=256
"-------Color settings
if &diff
  colo github
else
  colo gruvbox 
  set background=dark    " Setting dark mode for gruvbox "
endif

"----------------------------------------------------------------------------------
"  various
"----------------------------------------------------------------------------------

"-------Tsuquyomi for typescript----------
autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

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

"set encoding=utf-8

"----------------------------------------------------------------------------------
"  syntax, highlighting and spelling
"----------------------------------------------------------------------------------

syntax on
filetype plugin indent on

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

"--Ocaml
"Merlin
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"


"----------------------------------------------------------------------------------
"  multi-byte characters
"----------------------------------------------------------------------------------

"----------------------------------------------------------------------------------
"  various
"----------------------------------------------------------------------------------

"-------Airline settings-------------------
let g:airline_theme='lucius'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1


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

