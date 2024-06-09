local lua_indent_group = vim.api.nvim_create_augroup("lua-indent", { clear = true })
vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.lua",
  desc = "Sets indentation for lua files to be 2 spaces",
  group = lua_indent_group,
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end
})

local js_indent_group = vim.api.nvim_create_augroup("js-indent", { clear = true })
vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.ts,*.tsx,*.js,*.jsx",
  desc = "Sets indentation for js/ts files to be 2 spaces",
  group = js_indent_group,
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end
})
