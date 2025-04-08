
return {
  -- Core LSP Config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",         -- LSP installer
      "williamboman/mason-lspconfig.nvim", -- Mason integration
    },
    config = function()
      require("mason").setup() -- Setup Mason
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", "pyright", "ts_ls", "gopls", "clangd", -- C++
        },
      })

      local lspconfig = require("lspconfig")

      -- Configure Language Servers
      local servers = { "lua_ls", "pyright", "ts_ls", "gopls", "clangd" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end

      -- LSP Keybindings
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Hover Documentation" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
    end,
  },

  -- Mason (LSP Manager)
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
  },

  -- Mason LSP Integration
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
  },
}
