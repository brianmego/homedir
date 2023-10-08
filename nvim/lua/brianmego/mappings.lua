local function map(kind, lhs, rhs, opts)
	-- Possible Kinds:
	-- '' - normal, visual, select, operator pending (noremap)
	-- n  - normal mode
	-- v  - visual mode
	-- i  - insert mode
	-- c  - command line
	-- More details in :h map-table
	vim.api.nvim_set_keymap(kind, lhs, rhs, opts)
	-- More details in :h nvim_set_keymap
end
local silentnoremap = {noremap = true, silent = true}

vim.g.mapleader = " "
map('n',  'H', '^', silentnoremap)
map('n', 'L', '$', silentnoremap)
map('i', 'jk', '<esc>', silentnoremap)
map('n', '<C-J>', '<C-W><C-J>', silentnoremap)
map('n', '<C-K>', '<C-W><C-K>', silentnoremap)
map('n', '<C-L>', '<C-W><C-L>', silentnoremap)
map('n', '<C-H>', '<C-W><C-H>', silentnoremap)
map('n', '<C-P>', ':Files<CR>', silentnoremap)
map('n', '<C-F>', ':Rg<space>', silentnoremap)
map('n', '<leader>j', ':%!jq . -<CR>', silentnoremap)
map('n', '<leader>s', ':Git<CR>', silentnoremap)
map('n', '<leader>w', ':w<CR>', silentnoremap)
map('n', '<leader>q', ':q<CR>', silentnoremap)
map('n', '<leader>T', ':TagbarToggle<CR>', silentnoremap)
--copy current path to clipboard
map('n', '<leader>p', ':let @*=@%<CR>', silentnoremap)
map('n', '<leader>i', 'obreakpoint()<esc>', silentnoremap)
map('n', '<leader>e', ':Vexplore<CR>', silentnoremap)
map('n', '<leader>b', ':Buffers<CR>', silentnoremap)
map('n', '<leader>a', '<Plug>(coc-codeaction-selected)<CR>', silentnoremap)
map('n', '<leader>h', ':CocCommand document.toggleInlayHint<CR>', silentnoremap)
map('n', '<leader>x', ':%!xmllint --format -<CR>', silentnoremap)
map('n', '<leader>,', 'f,a<CR><esc>', silentnoremap)
map('n', '<leader>.', 't.a<CR><esc>l', silentnoremap)
map('n', '-', ':Neotree reveal_force_cwd float<CR>', silentnoremap)
map('', '<leader>>', ':IndentLinesToggle<CR>', silentnoremap)
vim.api.nvim_del_keymap('', 'Y')
map('', '<leader>S', ':vsp ~/.config/nvim/init.lua<CR>', {noremap=true})

map('n', 'gd', '<Plug>(coc-definition)', silentnoremap)
map('n', '<leader>d', '<Plug>(coc-definition)', silentnoremap)
map('n', '<leader>D', ':vsp<CR><Plug>(coc-definition)', silentnoremap)
map('n', 'gy', '<Plug>(coc-type-definition)', silentnoremap)
map('n', 'gi', '<Plug>(coc-implementation)', silentnoremap)
map('n', 'gr', '<Plug>(coc-references)', silentnoremap)
map('n', '<leader>l', ':CocDiagnostics<CR>', silentnoremap)
map('n', '[g', '<Plug>(coc-diagnostic-prev)', silentnoremap)
map('n', ']g', '<Plug>(coc-diagnostic-next)', silentnoremap)
map('n', '<leader>r', '<Plug>(coc-rename)', silentnoremap)
map('n', '<leader>f', '<Plug>(coc-format)', silentnoremap)
map('n', '<Up>', ':resize +2<CR>', silentnoremap)
map('n', '<Down>', ':resize -2<CR>', silentnoremap)
map('n', '<Left>', ':vertical resize -2<CR>', silentnoremap)
map('n', '<Right>', ':vertical resize +2<CR>', silentnoremap)

-- map('n', 'K', ':call <SID>show_documentation()<CR>', silentnoremap)
