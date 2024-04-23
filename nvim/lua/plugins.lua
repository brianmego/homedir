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
            require("configs/lightline")
        end,
    },
    -- Editing help
    {
        'ntpeters/vim-better-whitespace', -- Visualize trailing whitespace

        config = function()
            require("configs/better_whitespace")
        end,
    },
    'tpope/vim-unimpaired',  -- Complementary mapping hotkeys
    'tpope/vim-surround',    -- surround text objects with like symbols
    'tpope/vim-commentary',  -- comment blocks of code intelligently
    'tpope/vim-repeat',      -- Use . key on things like commentary and surround
    'Yggdroot/indentLine',   -- Visualize indentation level
    'tpope/vim-speeddating', -- Improve C-A and C-X for dates

    "preservim/tagbar",      -- Classes/functions/enums in sidebar

    -- File Viewing
    {
        "nvim-treesitter/nvim-treesitter", -- Syntax highlighting/folding/indentation
        build = ":TSUpdate",
        config = function()
            require("configs/treesitter")
        end
    },
    {
        'stevearc/oil.nvim',
        config = function()
            require("configs/oil")
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
            require("configs/dadbod")
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
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {'folke/neodev.nvim', opts = {}},
    {
        'neovim/nvim-lspconfig',
        config = function()
            require("configs/lspconfig")
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer", -- source for text in buffer
            "hrsh7th/cmp-path", -- source for file system paths in commands
            "hrsh7th/cmp-cmdline", -- source for vim commands
            "hrsh7th/cmp-nvim-lsp", -- source for lsp
            'SirVer/ultisnips',      -- Code Snippets
            "quangnguyen30192/cmp-nvim-ultisnips", -- For snippet autocompletion
            "onsails/lspkind.nvim", -- vs-code like pictograms
        },
        config = function()
            require("configs/cmp")
        end,
    },
    -- { 'neoclide/coc.nvim', branch = 'release' },

    -- Git
    'tpope/vim-fugitive',

    -- AI completion
    -- {
    --   'git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git',
    --   event = { 'BufReadPre', 'BufNewFile' }, -- Activate when a file is created/opened
    --   ft = { 'go', 'javascript', 'python', 'ruby' }, -- Activate when a supported filetype is open
    --   cond = function()
    --     return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= '' -- Only activate if token is present in environment variable (remove to use interactive workflow)
    --   end,
    --   opts = {
    --     statusline = {
    --       enabled = true, -- Hook into the builtin statusline to indicate the status of the GitLab Duo Code Suggestions integration
    --     },
    --   },
    -- }
}
