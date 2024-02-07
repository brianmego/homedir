-- keymappings
require('brianmego.mappings')

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- Default editor settings
require('brianmego.editor_settings')

-- Completion
vim.g.coc_global_extensions={
    'coc-erlang_ls',
    'coc-tsserver',
    'coc-snippets',
    'coc-pyright',
    'coc-json',
    'coc-html',
    'coc-css',
    'coc-rust-analyzer',
    'coc-go',
    'coc-lua',
}

vim.cmd([[
    " Add search to quickfix list
    function! s:build_quickfix_list(lines)
      call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
      copen
      cc
    endfunction

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
    autocmd BufWritePre *.py,*.rs,*lua :%s/\s\+$//e
    autocmd FileType python nnoremap <leader>t :Start -wait=always pytest -svv %<CR>
    autocmd FileType python nnoremap <leader>y "tyiw:Start -wait=always pytest -svv % -k <C-R>t<CR>

    """Go
    autocmd FileType go setlocal noexpandtab

    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

]])

