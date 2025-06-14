return {
  'williamboman/mason-lspconfig.nvim',
  cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'temchik00/toggle-signature-help.nvim' },
  },
  config = function()
    -- This is where all the LSP shenanigans will live

    local lsp = require('lsp-zero')
    lsp.setup({})
    local toggleSignature = require("toggle-signature")

    lsp.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp.default_keymaps({ buffer = bufnr, preserve_mappings = false, exclude = { 'gr' } })
      vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
      vim.keymap.set('i', '<C-s>', toggleSignature.toggle, { buffer = bufnr })
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
