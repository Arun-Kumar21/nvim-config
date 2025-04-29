require "core.options"
require "core.keymaps"

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require 'plugins.lualine',
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  --require 'plugins.treesitter',
  { "neovim/nvim-lspconfig" },
  require 'plugins.telescope',

  require 'plugins.bufferline',
  require 'plugins.neotree',
  require 'plugins.colortheme',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.autopairs',
  require 'plugins.gitsigns',
})

