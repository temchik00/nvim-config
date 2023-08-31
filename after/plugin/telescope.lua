local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc="telescope Find Files"})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc="telescope Find Git"})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {desc="telescope Find String"})
