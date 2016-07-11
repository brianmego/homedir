let g:python_host_prog= '/usr/local/bin/python'
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'geoffharcourt/one-dark.vim'
Plugin 'blueshirts/darcula'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-vinegar'
Plugin 'henrik/vim-indexed-search'
Plugin 'klen/python-mode'
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
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
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable           " enable syntax processing
colorscheme onedark
"set hidden
set colorcolumn=80
set ttyfast                     " faster redraw
set backspace=indent,eol,start
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
set splitright
set splitbelow
set foldmethod=indent
set foldnestmax=10
set nofoldenable
"set foldlevel=1
filetype indent on
filetype plugin on
set autoindent
set number              " show line numbers
set mouse=a             " Enable mouse scrolling
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu
set showmatch           " higlight matching parenthesis
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
set nowrap
let g:netrw_liststyle=3
let g:netrw_list_hide= '.*\.pyc$'
nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $
inoremap jk <esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let mapleader = " "
nmap <leader>j :%!python -m json.tool<CR>
map <leader>s :Gstatus<CR>
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>p oimport pdb<CR>pdb.set_trace()<esc>
map <leader>i oimport ipdb<CR>ipdb.set_trace()<esc>
map <leader>e :Vexplore<CR>
map <leader>h :Hexplore<CR>
map <leader>l :PymodeLint<CR>
map <leader>a :PymodeLintAuto<CR>
map <leader>x :%!xmllint --format -<CR>
map <leader>, f,a<CR><esc>
map <leader>. t.a<CR><esc>l
set wildignore+=*/tmp/*,*.pyc,htmlcov,*.swp,*.zip,cover,bootstrap,*_server,dists,logrotate.d,env
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

let g:pymode_rope = 0
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_write = 1
let g:pymode_virtualenv = 0
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_lint_options_pep8 = {'max_line_length': 150}

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
