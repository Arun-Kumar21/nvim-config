return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = true
      vim.g.nord_italic = false

      -- Toggle background transparency
      local bg_transparent = true

      local toggle_transparency = function()
          bg_transparent = not bg_transparent
          vim.g.nord_disable_background = bg_transparent
          vim.cmd [[colorscheme nord]]
      end 

      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false

      vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })

      require("nord").set()
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        term_colors = true,
        integrations = {
          treesitter = true,
          lsp_saga = true,
          cmp = true,
          gitsigns = true,
          telescope = true,
          nvimtree = true,
          dashboard = true,
          indent_blankline = { enabled = true, scope_color = "lavender" },
        },
      })
      vim.cmd.colorscheme("default")
    end,
  },
}

