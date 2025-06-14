return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    { 'L3MON4D3/LuaSnip' },
  },
  config = function()
    -- Here is where you configure the autocompletion settings.
    require('lsp-zero').extend_cmp()

    -- And you can configure cmp even more, if you want to.
    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()
    local kind_icons = require("temch.language-config").cmp_kind_icons
    cmp.setup({
      window = {
        documentation = cmp.config.window.bordered(),
        --completion = cmp.config.window.bordered(),
      },
      preselect = 'item',
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
      },
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<S-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping(function(fallback)
          local col = vim.fn.col('.') - 1

          if cmp.visible() then
            cmp.select_next_item({behavior = 'select'})
          elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            fallback()
          else
            cmp.complete()
          end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
      },
      formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = function(_, vim_item)
          vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
          return vim_item
        end,
      },
    })
  end
}
