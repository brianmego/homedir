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

    "preservim/tagbar",      -- Classes/functions/enums in sidebar

    -- File Viewing
    {
        "nvim-treesitter/nvim-treesitter", -- Syntax highlighting/folding/indentation
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "bash", "hcl", "html", "javascript", "lua", "python", "rust", "vim", "vimdoc", "sql", "regex", "rst" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        'stevearc/oil.nvim',
        config = function()
            require("oil_overrides")
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
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    'neovim/nvim-lspconfig',
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer", -- source for text in buffer
            "hrsh7th/cmp-path", -- source for file system paths in commands
            'SirVer/ultisnips',      -- Code Snippets
            "quangnguyen30192/cmp-nvim-ultisnips", -- For lua autocompletion
            "onsails/lspkind.nvim", -- vs-code like pictograms
        },
        config = function()
            local cmp = require("cmp")

            local lspkind = require("lspkind")

            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,preview,noselect",
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                    ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                }),
                -- sources for autocompletion
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "ultisnips" }, -- snippets
                    { name = "buffer" }, -- text within current buffer
                    { name = "path" }, -- file system paths
                }),
                -- configure lspkind for vs-code like pictograms in completion menu
                formatting = {
                    format = lspkind.cmp_format({
                        maxwidth = 50,
                        ellipsis_char = "...",
                    }),
                },
            })
        end,
    },
    -- { 'neoclide/coc.nvim', branch = 'release' },

    -- Git
    'tpope/vim-fugitive',

    -- -- AI completion
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
