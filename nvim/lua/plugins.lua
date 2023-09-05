return {
    -- colorschemes
    "rakr/vim-one",
    'morhetz/gruvbox',
    'blueshirts/darcula',
    'tyrannicaltoucan/vim-quantum',
    'altercation/vim-colors-solarized',

    -- editor decorations
    'ap/vim-css-color',      -- Adds colors to hexcodes
    'itchyny/lightline.vim', -- Statusline config

    -- Editing help
    'ntpeters/vim-better-whitespace', -- Visualize trailing whitespace
    'tpope/vim-unimpaired',           -- Complementary mapping hotkeys
    'tpope/vim-surround',             -- surround text objects with like symbols
    'tpope/vim-commentary',           -- comment blocks of code intelligently
    'tpope/vim-repeat',               -- Use . key on things like commentary and surround
    'Yggdroot/indentLine',            -- Visualize indentation level
    'tpope/vim-speeddating',          -- Improve C-A and C-X for dates
    'junegunn/fzf',                   -- Quick Code Search with Rg (install)
    'junegunn/fzf.vim',               -- Quick Code Search
    'SirVer/ultisnips',               -- Code Snippets

    -- File Viewing
    { 'nvim-neo-tree/neo-tree.nvim', opts = { filesystem = { window = { position = "current" } } } },
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',

    -- Not yet sorted
    'tpope/vim-eunuch',
    'tpope/vim-dispatch',
    'henrik/vim-indexed-search',
    'jiangmiao/auto-pairs',

    -- Syntax
    'fatih/vim-hclfmt',
    'lepture/vim-jinja',

    -- Completion
    { 'neoclide/coc.nvim',           branch = 'release' },

    -- Git
    'tpope/vim-fugitive',
}
