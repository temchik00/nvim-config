return {
  'williamboman/mason-lspconfig.nvim',
  cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
  },
  config = function()
    -- This is where all the LSP shenanigans will live

    local lsp = require('lsp-zero').preset({})

    lsp.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp.default_keymaps({ buffer = bufnr, preserve_mappings = false })
    end)
    local lsp_servers = require("temch.language-config").lsp_servers
    require('mason-lspconfig').setup({
      ensure_installed = lsp_servers,
      handlers = {
        lsp.default_setup,
        lua_ls = function()
          -- (Optional) Configure lua language server for neovim
          require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        end,
      }
    })
  end
}
