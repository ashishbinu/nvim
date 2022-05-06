require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.lsnip")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
-- require("user.comment") -- Fix it when comment.nvim works
require("user.gitsigns")
require("user.nvim-tree")
require("user.bufferline")
require("user.lualine")
-- require("user.toggleterm")
require("user.floaterm")
require("user.project")
require("user.impatient")
require("user.indentline")
require("user.alpha")
require("user.whichkey")
require("user.utils").setup({})
require("user.commands")
require("user.autocommands")
require("user.presence")

vim.keymap.set(
  "n",
  "<leader>ts",
  "<cmd>FloatermNew --wintype=split --height=0.4 --width=1.0 --title=Terminal$1 --position=bottom<cr>"
)
vim.keymap.set(
  "n",
  "<leader>tv",
  "<cmd>FloatermNew --wintype=vsplit --height=1 --width=0.4 --title=Terminal$1 --position=right<cr>"
)
