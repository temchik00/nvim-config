vim.opt.termguicolors = true

-- Line numbers and relative numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab size
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Replace tabs with spaces
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.hlsearch = false
vim.opt.incsearch = false

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.diagnostic.config({
  virtual_lines=false,
  virtual_text=true,
  signs=true,
  underline=true,
})
