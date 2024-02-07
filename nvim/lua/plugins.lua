return {
    -- colorschemes
    "rakr/vim-one",
    'morhetz/gruvbox',
    'blueshirts/darcula',
    'tyrannicaltoucan/vim-quantum',
    'altercation/vim-colors-solarized',

    -- editor decorations
    'ap/vim-css-color',          -- Adds colors to hexcodes
    {
        'itchyny/lightline.vim', -- Statusline config
        config = function()
            require("lightline").setup()
        end,
    },
    -- Editing help
    {
        'ntpeters/vim-better-whitespace', -- Visualize trailing whitespace

        config = function()
            require("better-whitespace").setup()
        end,
    },
    'tpope/vim-unimpaired',  -- Complementary mapping hotkeys
    'tpope/vim-surround',    -- surround text objects with like symbols
    'tpope/vim-commentary',  -- comment blocks of code intelligently
    'tpope/vim-repeat',      -- Use . key on things like commentary and surround
    'Yggdroot/indentLine',   -- Visualize indentation level
    'tpope/vim-speeddating', -- Improve C-A and C-X for dates
    'SirVer/ultisnips',      -- Code Snippets
    "preservim/tagbar",      -- Classes/functions/enums in sidebar

    -- File Viewing
    {
        'nvim-neo-tree/neo-tree.nvim', -- Filesystem viewer
        opts = {
            filesystem = {
                window = {
                    position = "current"
                }
            }
        },
        dependencies = {
            'nvim-lua/plenary.nvim',       -- Common utility functions for extensions
            'nvim-tree/nvim-web-devicons', -- Icon support in the editor
            'MunifTanjim/nui.nvim',        -- Popups and other screen drawing items
        },
    },
    {
        "nvim-treesitter/nvim-treesitter", -- Syntax highlighting/folding/indentation
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "bash", "hcl", "html", "javascript", "lua", "python", "rust", "vim", "vimdoc", "sql", "regex" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },

    -- Database
    {
        "tpope/vim-dadbod",
        dependencies = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
        },
        config = function()
            require("dadbod").setup()
        end,
        cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Not yet sorted
    'tpope/vim-eunuch',
    'tpope/vim-dispatch',
    'henrik/vim-indexed-search',
    'jiangmiao/auto-pairs',

    -- Syntax
    'lepture/vim-jinja',

    -- Completion
    { 'neoclide/coc.nvim', branch = 'release' },

    -- Git
    'tpope/vim-fugitive',
}
