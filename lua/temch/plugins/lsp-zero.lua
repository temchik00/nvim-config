return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'dev-v3',
        lazy = true,
        config = false,
    },
    {
        "hrsh7th/cmp-nvim-lsp-signature-help",
        event = 'InsertEnter',
        dependencies = { { 'hrsh7th/nvim-cmp' } },
    },
    {
        'williamboman/mason.nvim',
        cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
        lazy = true,
        config = true,
    },
    -- Autocompletion
    {
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
            local kind_icons = {
                Text = '',
                Method = ' ',
                Function = '',
                Constructor = '',
                Field = '',
                Variable = '',
                Class = '',
                Interface = '',
                Module = ' ',
                Property = '',
                Unit = '',
                Value = '',
                Enum = '',
                Keyword = '',
                Snippet = '',
                Color = '',
                File = '',
                Reference = '',
                Folder = ' ',
                EnumMember = ' ',
                Constant = '',
                Struct = ' ',
                Event = '',
                Operator = '',
                TypeParameter = '',
            }
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
    },

    -- LSP
    {
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

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'tsserver',
                    'eslint',
                    'bashls',
                    'clangd',
                    'dockerls',
                    'docker_compose_language_service',
                    'pyright',
                    'sqlls'
                },
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
}
