local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer, close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> " | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
-- packer.init {
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end,
--   },
-- }

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
  use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
  -- use "numToStr/Comment.nvim" -- Easily comment stuff
  use("tpope/vim-commentary")

  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use("akinsho/bufferline.nvim")
  use("famiu/bufdelete.nvim")
  use("nvim-lualine/lualine.nvim")
  -- use("akinsho/toggleterm.nvim")
  use("voldikss/vim-floaterm")
  use("lewis6991/impatient.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("goolord/alpha-nvim")
  use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
  use("folke/which-key.nvim")
  use("ggandor/lightspeed.nvim")
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("tpope/vim-eunuch")
  use({
    "907th/vim-auto-save",
    cond = function()
      return vim.g.auto_save == 1
    end,
    event = "InsertLeavePre",
  })
  use("folke/trouble.nvim")
  use("NTBBloodbath/rest.nvim")
  use("raimon49/requirements.txt.vim")
  -- use("nathom/filetype.nvim")
  use("mattn/emmet-vim")
  use("briancollins/vim-jst")
  use("andweeb/presence.nvim")
  use("kmonad/kmonad-vim")
  use("baskerville/vim-sxhkdrc")
  use("Pocco81/TrueZen.nvim")
  -- use("folke/zen-mode.nvim")
  -- use("github/copilot.vim")
  -- use("j-hui/fidget.nvim")

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  -- use "lunarvim/darkplus.nvim"
  use("folke/tokyonight.nvim")
  use("navarasu/onedark.nvim")
  use("YorickPeterse/vim-paper")
  use({
    "rose-pine/neovim",
    as = "rose-pine",
    tag = "v0.1.0", -- Optional tag release
  })
  use("shaunsingh/nord.nvim")
  use("ellisonleao/gruvbox.nvim")

  -- cmp plugins
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("hrsh7th/cmp-nvim-lua") -- nvim stuff completion
  use("hrsh7th/cmp-emoji") -- nvim stuff completion
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  -- use("hrsh7th/cmp-copilot")

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use("neovim/nvim-lspconfig") -- enable LSP
  use("williamboman/nvim-lsp-installer") -- simple to use language server installer
  use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
  -- use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  use("/home/ash/Projects/OpenSource/null-ls.nvim")
  use("b0o/schemastore.nvim")
  use({
    "akinsho/flutter-tools.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("flutter-tools").setup({})
    end,
  })
  use("simrat39/rust-tools.nvim") -- Change this to simrat39 when the pr merges
  -- use({ "simrat39/rust-tools.nvim", commit = "7b4d155dd47e211ee661cbb4c7969b245f768edb" })

  -- Telescope
  use("nvim-telescope/telescope.nvim")

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("p00f/nvim-ts-rainbow")
  use({ "nvim-treesitter/playground", run = ":TSInstall query" })
  use("windwp/nvim-ts-autotag")

  -- Git
  use("lewis6991/gitsigns.nvim")
  use("tpope/vim-fugitive")

  -- Filetype plugin
  use("TovarishFin/vim-solidity")

  use({
    "glacambre/firenvim",
    run = function()
      vim.fn["firenvim#install"](0)
    end,
  })

  use("simnalamburt/vim-mundo")

  use({ "iamcco/markdown-preview.nvim", run = [[cd app && yarn install]] })

  use("ray-x/go.nvim")

  use("HiPhish/info.vim")

  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({})
    end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
