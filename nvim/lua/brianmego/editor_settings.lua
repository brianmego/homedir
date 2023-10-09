vim.o.termguicolors=true
vim.o.tabstop=4
vim.o.softtabstop=4
vim.o.shiftwidth=4
vim.o.modelines=1
vim.o.backspace="indent,eol,start"
vim.o.sessionoptions="buffers,curdir,folds,help,tabpages,winsize,terminal"  -- Do not save blank windows when saving sessions

-- vim.o.ttyfast            -- faster redraw
vim.cmd "set nobackup"
vim.cmd "set nowritebackup"
vim.cmd "set hidden"
vim.cmd "set lazyredraw"
vim.cmd "set smarttab"
vim.cmd "set cindent"
vim.cmd "set expandtab"          -- use spaces for tabs
vim.cmd "set visualbell"
vim.cmd "set splitright"
vim.cmd "set splitbelow"
vim.cmd "set autoindent"
vim.cmd "set cindent"
vim.cmd "set number"             -- show line numbers
vim.cmd "set relativenumber"     -- show relative numbering from cursor (+1, +2, -1, -2)
vim.cmd "set showcmd"            -- show command in bottom bar
vim.cmd "set cursorline"         -- highlight current line
-- vim.cmd "set wildmenu"
vim.cmd "set showmatch"           -- higlight matching parenthesis
vim.cmd "set ignorecase"          -- ignore case when searching
vim.cmd "set incsearch"           -- search as characters are entered
vim.cmd "set hlsearch"            -- highlight all matches
vim.cmd "set nowrap"
vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"
vim.cmd "set nofoldenable"        -- Disable folding at startup.

vim.cmd 'colorscheme quantum'

vim.o.listchars="tab:→ ,space:·,nbsp:␣,eol:¶"

vim.api.nvim_create_autocmd({"BufEnter"}, {
    callback = function()
        vim.cmd "set foldmethod=expr"
    end
})
