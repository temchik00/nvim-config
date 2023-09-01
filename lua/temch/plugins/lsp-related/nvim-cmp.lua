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
          --completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        preselect = 'item',
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'nvim_lsp_signature_help' }
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<S-Space>'] = cmp.mapping.complete(),
          ['<Tab>'] = cmp_action.tab_complete(),
          ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
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
