--Remap space as leader key
vim.keymap.set("n", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Better window navigation
-- Splits navigation
vim.cmd([[
"Better Window Navigation
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> <cmd>call WinMove('h')<CR>
nnoremap <silent> <C-j> <cmd>call WinMove('j')<CR>
nnoremap <silent> <C-k> <cmd>call WinMove('k')<CR>
nnoremap <silent> <C-l> <cmd>call WinMove('l')<CR>

augroup TerminalNavigation
    autocmd!
    autocmd TermOpen * tnoremap <buffer> <C-h> <cmd>wincmd h<CR>
    autocmd TermOpen * tnoremap <buffer> <C-j> <cmd>wincmd j<CR>
    autocmd TermOpen * tnoremap <buffer> <C-k> <cmd>wincmd k<CR>
    autocmd TermOpen * tnoremap <buffer> <C-l> <cmd>wincmd l<CR>
augroup END

]])


-- Resize windows
vim.keymap.set("n", "<A-j>", "<cmd>resize -1<CR>")
vim.keymap.set("n", "<A-k>", "<cmd>resize +1<CR>")
vim.keymap.set("n", "<A-h>", "<cmd>vertical resize -1<CR>")
vim.keymap.set("n", "<A-l>", "<cmd>vertical resize +1<CR>")

-- Navigate buffers
-- keymap("n", "<Tab>", "<Cmd>bnext<CR>", opt)
-- keymap("n", "<S-Tab>", "<Cmd>bprevious<CR>", opt)
vim.keymap.set("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]])
vim.keymap.set("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]])

-- Delete buffers
vim.keymap.set("n", "<A-q>", function()
    return require("bufdelete").bufdelete(0)
end)

-- Folds
vim.keymap.set("n", ",f", "za")
vim.keymap.set("n", "zi", "zizz")

-- Lightspeed
vim.keymap.set({ "n", "v" }, "<LocalLeader>s", "<Plug>Lightspeed_s")
vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<Plug>Lightspeed_S")

-- Move text up and down
vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- copy whole file content
vim.keymap.set("n", "<leader>y", [[<Cmd>%y+<CR>]])

-- Reselect last paste
vim.keymap.set("n", "gp", "`[v`]")

-- Better line navigation
vim.keymap.set("n", "gh", "^")
vim.keymap.set("v", "gh", "^")
vim.keymap.set("n", "gl", "$")
vim.keymap.set("v", "gl", "$")

-- Better command line key
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")
vim.keymap.set("x", ";", ":")
vim.keymap.set("x", ":", ";")

-- Repeat last ex command
vim.keymap.set({ "n", "v" }, "g.", "@:")

-- -- Repeat last macro
-- keymap('n','Q','@@',opt) -- Enabled in new version of neovim

-- Remove highlight
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>")

-- Centering after command
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "gi", "gi<C-o>zz")
vim.keymap.set("n", "G", "Gzz")

--Better Joining lines with J
vim.keymap.set("n", "J", "mzJ`z")

-- Quit
vim.keymap.set("n", "<C-q>", [[<Cmd>quit!<CR>]])
vim.keymap.set("i", "<C-q>", [[<Cmd>quit!<CR>]])

-- Save
vim.keymap.set("n", "<C-s>", [[<Cmd>write!<CR>]])
vim.keymap.set("i", "<C-s>", [[<Cmd>write!<CR>]])

-- Ctrl-Backspace to delete a word
vim.keymap.set("i", "<C-H>", "<C-W>")
vim.keymap.set("c", "<C-H>", "<C-W>")
-- keymap("i"," "," <c-g>u")
-- keymap("i",".",".<c-g>u")
-- keymap("i","(","(<c-g>u")
-- keymap("i",")",")<c-g>u")

-- Command mode
vim.keymap.set("c", "<C-j>", "<C-n>")
vim.keymap.set("c", "<C-k>", "<C-p>")

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "p", '"_dP')

-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Horizontal Scrolling with mouse
vim.keymap.set({ "n", "o", "v" }, "<S-ScrollWheelUp>", "<ScrollWheelLeft>", { remap = true })
vim.keymap.set({ "n", "o", "v" }, "<S-2-ScrollWheelUp>", "<2-ScrollWheelLeft>", { remap = true })
vim.keymap.set({ "n", "o", "v" }, "<S-3-ScrollWheelUp>", "<3-ScrollWheelLeft>", { remap = true })
vim.keymap.set({ "n", "o", "v" }, "<S-4-ScrollWheelUp>", "<4-ScrollWheelLeft>", { remap = true })
vim.keymap.set({ "n", "o", "v" }, "<S-ScrollWheelDown>", "<ScrollWheelRight>", { remap = true })
vim.keymap.set({ "n", "o", "v" }, "<S-2-ScrollWheelDown>", "<2-ScrollWheelRight>", { remap = true })
vim.keymap.set({ "n", "o", "v" }, "<S-3-ScrollWheelDown>", "<3-ScrollWheelRight>", { remap = true })
vim.keymap.set({ "n", "o", "v" }, "<S-4-ScrollWheelDown>", "<4-ScrollWheelRight>", { remap = true })

vim.keymap.set("n", "cmm", "<Plug>CommentaryLine", { remap = true })
vim.keymap.set("o", "cm", "<Plug>Commentary", { remap = true })
vim.keymap.set("n", "cm", "<Plug>Commentary", { remap = true })
vim.keymap.set("x", "cm", "<Plug>Commentary", { remap = true })

-- terminal
-- Quit the terminal from insert mode
vim.keymap.set("t", "<C-q>", "<C-><C-N><cmd>quit!<CR>", { silent = true })
-- vim.cmd([[ tnoremap <Esc><Esc> <C-\><C-n>]])
vim.keymap.set("t", "jk", "<C-><C-n>")


vim.keymap.set("n", "<F1>", "<Cmd>FloatermNew<CR>", { silent = true })
vim.keymap.set("n", "<F2>", "<Cmd>FloatermNext<CR>", { silent = true })
vim.keymap.set("n", "<F3>", "<Cmd>FloatermPrev<CR>", { silent = true })
vim.keymap.set("n", "<F4>", "<Cmd>FloatermToggle<CR>", { silent = true })

vim.keymap.set("t", "<F1>", "<Cmd>FloatermNew<CR>", { silent = true })
vim.keymap.set("t", "<F2>", "<Cmd>FloatermNext<CR>", { silent = true })
vim.keymap.set("t", "<F3>", "<Cmd>FloatermPrev<CR>", { silent = true })
vim.keymap.set("t", "<F4>", "<Cmd>FloatermToggle<CR>", { silent = true })
