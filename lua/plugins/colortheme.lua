-- local is_transparent = true

-- local function toggle_background()
--   is_transparent = not is_transparent
--
--   -- Adjust background settings for all themes accordingly
--   vim.g.nord_disable_background = is_transparent
--   vim.g.moonflyTransparent = is_transparent
--   vim.g.catppuccin_options = { transparent_background = is_transparent }
--   vim.g.kanagawa_transparent = is_transparent
--
--   -- Re-apply the current colorscheme
--   local current_colorscheme = vim.g.colors_name
--   if current_colorscheme then
--     vim.cmd("colorscheme " .. current_colorscheme)
--   end
-- end

return {
  -- Nord colorscheme
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = true
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false
    end,
  },

  -- Catppuccin colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
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
    end,
  },

  -- Kanagawa colorscheme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        theme = "wave",
        background = {
          dark = "wave",
          light = "lotus",
        },
      })
    end,
  },

  -- Moonfly colorscheme (DEFAULT)
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.moonflyTransparent = false 
      vim.g.moonflyCursorColor = true
      vim.g.moonflyNormalFloat = true
      vim.cmd("colorscheme moonfly")

      -- -- Set keymap for background toggle (currently disabled)
      -- vim.keymap.set("n", "<leader>bg", toggle_background, { noremap = true, silent = true })
    end,
  },

  -- Additional colorschemes
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    config = function()
      require('nightfox').setup({
        options = {
          transparent = true,
          terminal_colors = true,
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
      require("tokyonight").setup({
        style = "moon",
        transparent = true,
        terminal_colors = true,
      })
    end,
  },
}

