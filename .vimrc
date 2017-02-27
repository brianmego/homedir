set nocompatible              " be iMproved, required
filetype off                  " required

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'rakr/vim-one'
Plug 'bling/vim-airline'
Plug 'blueshirts/darcula'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'henrik/vim-indexed-search'
Plug 'neomake/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/taglist.vim'
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call plug#end()              " required
filetype plugin indent on    " required

syntax enable           " enable syntax processing

if (has("termguicolors"))
    set termguicolors
endif

if has('nvim')
    nmap <BS> :<C-u>TmuxNavigateLeft<CR>
else
    nmap <C-h> <C-w>h
endif

set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum

set background=dark
let g:airline_theme='quantum'
let g:quantum_black = 1
colorscheme quantum
set hidden
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
set autoindent
set number              " show line numbers
set relativenumber      " show relative numbering from cursor (+1, +2, -1, -2)
set mouse=a             " Enable mouse scrolling
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu
set showmatch           " higlight matching parenthesis
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
set sessionoptions-=blank  "Do not save blank windows when saving sessions
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
map <leader>j :%!pypprint<CR>
map <leader>s :Gstatus<CR>
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>t :TlistToggle<CR>
map <leader>p :pta<CR>
map <leader>i oimport ipdb<CR>ipdb.set_trace()<esc>
map <leader>e :Vexplore<CR>
map <leader>h :Hexplore<CR>
" map <leader>l :PymodeLint<CR>
" map <leader>a :PymodeLintAuto<CR>
map <leader>x :%!xmllint --format -<CR>
map <leader>, f,a<CR><esc>
map <leader>. t.a<CR><esc>l
set wildignore+=*/tmp/*,*.pyc,htmlcov,*.swp,*.zip,cover,bootstrap,*_server,dists,logrotate.d,env
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:deoplete#enable_at_startup = 1
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" autocmd FileType python set omnifunc=python3complete#Complete

let g:indentLine_enabled = 0
map <leader>> :IndentLinesToggle<CR>

" Neomake Settings
autocmd! BufWritePost *.py Neomake
" let g:neomake_python_enabled_makers = ["pylint", "python", "pycodestyle"]
map <leader>l :lopen<CR>

" function! SyntasticCheckHook(errors)
"     if !empty(a:errors)
"         let g:syntastic_loc_list_height = min([len(a:errors), 10])
"     endif
" endfunction

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
