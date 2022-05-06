vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _wrap
    autocmd!
    autocmd FileType Trouble,markdown setlocal wrap
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _manual_folds
    autocmd!
    autocmd BufEnter ~/.config/nvim/*/*.lua,~/.config/nvim//*.lua setl foldmethod=marker
  augroup end

  augroup _http_filetype
    autocmd!
    autocmd FileType http nmap <buffer> <leader>ra <Plug>RestNvim
    autocmd FileType http nmap <buffer> <leader>rp <Plug>RestNvimPreview
    autocmd FileType http nmap <buffer> <leader>rl <Plug>RestNvimLast
    autocmd FileType http command! -buffer RestNvim lua require('rest-nvim').run()
    autocmd FileType http command! -buffer RestNvimPreview lua require('rest-nvim').run(true)
  augroup end

  augroup _terminal
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermClose *  call feedkeys("\<CR>")
    autocmd TermClose * if(&ft != 'floaterm') | call feedkeys("\<CR>") | endif
    autocmd BufEnter term://* startinsert
    autocmd TermOpen * setlocal nonumber norelativenumber scl=no
    "autocmd User FloatermOpen setlocal nonumber norelativenumber laststatus=0 scl=no
    "autocmd BufEnter term://* setlocal nonumber norelativenumber laststatus=0 scl=no
  augroup end

  augroup _env
    autocmd!
    autocmd BufEnter .env lua vim.diagnostic.disable(0)
  augroup end

"  augroup _unmap_ctrl_w
"    autocmd!
"    autocmd Filetype TelescopePrompt imapclear <c-w>
"  augroup end
]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end


vim.cmd([[
autocmd BufNewFile *.go 0r ~/.config/nvim/skeleton/skeleton.go
autocmd BufNewFile *.html 0r ~/.config/nvim/skeleton/skeleton.html
autocmd BufNewFile *.c 0r ~/.config/nvim/skeleton/skeleton.c
]])
