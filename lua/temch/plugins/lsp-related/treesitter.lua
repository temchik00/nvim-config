return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local configs = require("nvim-treesitter.configs")
    local languages = require("temch.language-config").treesitter_servers
    configs.setup({
      ensure_installed = languages,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
