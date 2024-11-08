local M = {}

M.lsp_servers = {
  'lua_ls',
  'ts_ls',
  'eslint',
  'bashls',
  'clangd',
  'dockerls',
  'docker_compose_language_service',
  'pyright',
  'sqlls'
}

M.treesitter_servers = {
  "bash",
  "c",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "lua",
  "luadoc",
  "luap",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "regex",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml"
}

M.cmp_kind_icons = {
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

return M
