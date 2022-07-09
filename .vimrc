set nocompatible              " be iMproved, required
filetype off                  " required

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin()

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"
" Editor
Plug 'rakr/vim-one'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'blueshirts/darcula'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'henrik/vim-indexed-search'
Plug 'christoomey/vim-tmux-navigator'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
    \ 'coc-erlang_ls',
    \ 'coc-tsserver',
    \ 'coc-snippets',
    \ 'coc-pyright',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-rust-analyzer',
    \ 'coc-go'
\ ]

" Git
Plug 'tpope/vim-fugitive'

" Python
" Plug 'davidhalter/jedi-vim'
Plug 'Vimjas/vim-python-pep8-indent'

" Rust
" Plug 'rust-lang/rust'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'

" Syntax
Plug 'fatih/vim-hclfmt'
Plug 'lepture/vim-jinja'


" All of your Plugins must be added before the following line
call plug#end()              " required
filetype plugin indent on    " required

syntax enable           " enable syntax processing

if (has("termguicolors"))
    set termguicolors
endif

nmap <C-h> <C-w>h

" set t_8b=[48;2;%lu;%lu;%lum
" set t_8f=[38;2;%lu;%lu;%lum

"Statusline
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'one' ,
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
\ }

set background=dark
let g:one_allow_italics = 1
colorscheme one
set nobackup
set nowritebackup
set hidden
set ttyfast                     " faster redraw
set lazyredraw
set backspace=indent,eol,start
set tabstop=4           " 4 space tab
set softtabstop=4       " 4 space tab
set shiftwidth=4
" set clipboard+=unnamedplus
set smarttab
set expandtab           " use spaces for tabs
set visualbell
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
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

let g:netrw_liststyle=3
let g:netrw_list_hide= '.*\.pyc$'
nnoremap H ^
nnoremap L $
inoremap jk <esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-P> :Files<CR>
nnoremap <C-F> :Rg<space>
let mapleader = " "
map <leader>j :%!jq . -<CR>
map <leader>s :Git<CR>
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>T :TagbarToggle<CR>
"copy current path to clipboard
map <leader>p :let @*=@%<CR>
map <leader>i obreakpoint()<esc>
map <leader>e :Vexplore<CR>
map <leader>b :Buffers<CR>
map <leader>a :CocAction<CR>
" nnoremap <leader>R :YcmCompleter GoToReferences<CR>
map <leader>h :Hexplore<CR>
map <leader>x :%!xmllint --format -<CR>
map <leader>, f,a<CR><esc>
map <leader>. t.a<CR><esc>l
set wildignore+=*/tmp/*,*.pyc,htmlcov,*.swp,*.zip,cover,dists,dist,node_modules,bower_components,tmp,*/build/lib/*,logrotate.d,__pycache__/,.idea/,.git/,.*,*.beam,target
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:ycm_key_list_select_completion=[]
let g:indentLine_enabled = 0
map <leader>> :IndentLinesToggle<CR>
" Set Vim.ack to use ag instead of ack
let g:ackprg = 'ag --vimgrep'

"""COMPLETION

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()
inoremap <silent><expr> <F1> CocActionAsync('showSignatureHelp')
inoremap <silent><expr> <F2> coc#refresh()
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>D :vsp<CR><Plug>(coc-definition)  " Open in Vertical split
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>l :CocDiagnostics<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Symbol renaming.
nmap <leader>r <Plug>(coc-rename)
nmap <leader>f <Plug>(coc-format)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"""Rust
autocmd FileType rust nnoremap <leader>t :Start -wait=always cargo test<CR>

"""Python
autocmd FileType python setlocal colorcolumn=80
autocmd BufNewFile,BufRead *.jinja,*.jinja2 set ft=jinja
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType python nnoremap <leader>t :Start -wait=always pytest -svv %<CR>
autocmd FileType python nnoremap <leader>y "tyiw:Start -wait=always pytest -svv % -k <C-R>t<CR>

"""Go
autocmd FileType go setlocal noexpandtab

""""HTML
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

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


au FocusGained,BufEnter * :silent! !
set autoread

nnoremap <Up>     :resize +2<Cr>
nnoremap <Down>   :resize -2<Cr>
nnoremap <Left>   :vertical resize -2<Cr>
nnoremap <Right>  :vertical resize +2<Cr>
