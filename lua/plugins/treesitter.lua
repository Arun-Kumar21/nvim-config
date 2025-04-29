return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "python", "javascript", "typescript", "vimdoc",
        "vim", "regex", "terraform", "sql", "dockerfile",
        "toml", "json", "java", "groovy", "go",
        "gitignore", "graphql", "yaml", "make",
        "cmake", "markdown", "markdown_inline", "bash",
        "tsx", "css", "html",
      },
      auto_install = true,
      highlight = {
        enable = true,
        disable = { "ruby", "markdown" }, -- Disable treesitter for ruby and markdown
        additional_vim_regex_highlighting = { "ruby" }, -- Enable regex for ruby
      },
      rainbow = {
        enable = true,
        extended_mode = true, -- Highlight non-bracket delimiters like html tags
        max_file_lines = nil, -- Disable for large files
      },
      indent = {
        enable = true,
        disable = { "ruby" }, -- indentation issues with Ruby
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          node_decremental = "grm",
          scope_incremental = "grc",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer", -- select function
            ["if"] = "@function.inner", -- select inner function
            ["ac"] = "@class.outer",    -- select class
            ["ic"] = "@class.inner",    -- select inner class
          },
        },
      },
    })
  end,
}

