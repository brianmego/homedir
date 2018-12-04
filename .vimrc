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
Plug 'henrik/vim-indexed-search'
Plug 'neomake/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/taglist.vim'
Plug 'SirVer/ultisnips'
Plug 'davidhalter/jedi-vim'
Plug 'Yggdroot/indentLine'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'mileszs/ack.vim'
Plug 'fatih/vim-hclfmt'
Plug 'jiangmiao/auto-pairs'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

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

set background=dark
" let g:airline_theme='quantum'
let g:quantum_black = 1
colorscheme one
set hidden
set ttyfast                     " faster redraw
set lazyredraw
set backspace=indent,eol,start
set tabstop=4           " 4 space tab
" set clipboard+=unnamedplus
set smarttab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set visualbell
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
map <leader>x :%!xmllint --format -<CR>
map <leader>, f,a<CR><esc>
map <leader>. t.a<CR><esc>l
set wildignore+=*/tmp/*,*.pyc,htmlcov,*.swp,*.zip,cover,bootstrap,*_server,dists,dist,node_modules,bower_components,tmp,logrotate.d,__pycache__/,.idea/,.git/,.*
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
autocmd FileType python setlocal colorcolumn=80

let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

let g:indentLine_enabled = 0
map <leader>> :IndentLinesToggle<CR>

" Set Vim.ack to use ag instead of ack
let g:ackprg = 'ag --vimgrep'

" Jedi settings
set completeopt=menuone,preview
let g:jedi#popup_on_dot = 0

" Neomake Settings
autocmd! BufWritePost *.py Neomake
let g:neomake_open_list = 2
map <leader>l :lopen<CR>

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


" Monitor for external changes to buffers
" Grabbed from http://vim.wikia.com/wiki/Have_Vim_check_automatically_if_the_file_has_changed_externally

command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})

function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end
  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end
  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"
  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')
  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end
  " echo msg
  let @"=reg_saved
endfunction

let autoreadargs={'autoread':1}
execute WatchForChanges("*",autoreadargs)

nnoremap <Up>     :resize +2<Cr>
nnoremap <Down>   :resize -2<Cr>
nnoremap <Left>   :vertical resize -2<Cr>
nnoremap <Right>  :vertical resize +2<Cr>
