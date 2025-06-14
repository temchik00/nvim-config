-- local signature_help = require("temch.my_plugins.signature")
vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>ee", "<cmd>Neotree focus<CR>", { desc = "Explorer focus" })
vim.keymap.set("n", "<Leader>et", "<cmd>Neotree toggle<CR>", { desc = "Explorer Toggle" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("n", "<C-A-k>", ":t.-1<CR>", { desc = "copy line up" })
vim.keymap.set("n", "<C-A-j>", ":t.<CR>", { desc = "copy line down" })
vim.keymap.set("v", "<C-A-j>", ":t'<-1<CR>gv", { desc = "copy block up" })
vim.keymap.set("v", "<C-A-k>", ":t'><CR>gv", { desc = "copy block down" })

local function toggle_wrap_mode()
  if vim.opt.wrap:get() then
    vim.opt.wrap = false;
    vim.keymap.del({ 'v', 'n' }, 'j')
    vim.keymap.del({ 'v', 'n' }, 'k')
    vim.keymap.del({ 'v', 'n' }, '0')
    vim.keymap.del({ 'v', 'n' }, '$')
    vim.keymap.del({ 'v', 'n' }, '^')
  else
    vim.opt.wrap = true;
    vim.keymap.set({ 'v', 'n' }, "j", "gj", { desc = "wrapped line navigation" })
    vim.keymap.set({ 'v', 'n' }, "k", "gk", { desc = "wrapped line navigation" })
    vim.keymap.set({ 'v', 'n' }, "0", "g0", { desc = "wrapped line navigation" })
    vim.keymap.set({ 'v', 'n' }, "$", "g$", { desc = "wrapped line navigation" })
    vim.keymap.set({ 'v', 'n' }, "^", "g^", { desc = "wrapped line navigation" })
  end
end
vim.keymap.set({ "i", "v", "n" }, "<A-w>", toggle_wrap_mode, { desc = "toggle word wrap" })
vim.keymap.set("n", "<Leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos" })
vim.keymap.set("n", "g?", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Open floating diagnostic" })
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.config({virtual_lines=not vim.diagnostic.config().virtual_lines})<CR>",
  { desc = "Toggle underline diagnostic" })
