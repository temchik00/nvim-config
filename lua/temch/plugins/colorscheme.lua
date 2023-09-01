return {
  {
    "sickill/vim-monokai",
    lazy = true,
  },
  {
    "catppuccin/nvim",
    priority = 1000,
    lazy = false,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        show_end_of_buffer = true,
        integrations = {
          alpha = false,
          cmp = true,
          barbecue = false,
          dashboard = false,
          flash = false,
          gitsigns = false,
          neotree = true,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
          },
          notify = true,
          neogit = false,
          nvimtree = false,
          semantic_tokens = true,
          treesitter = true,
          ts_rainbow = false,
          ts_rainbow2 = false,
          rainbow_delimiters = false,
          telescope = true,
          mason = true,
          which_key = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
        }
      })
      vim.cmd([[colorscheme catppuccin]])
    end
  }
}
