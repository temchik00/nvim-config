return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function ()
     local harpoon = require("harpoon")
    -- REQUIRED
    harpoon:setup()
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "add harpoon mark" })
    vim.keymap.set("n", "<leader>d", function() harpoon:list():remove() end, { desc = "remove harpoon mark" })
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "swtich to harpoon mark 1" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "swtich to harpoon mark 2" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "swtich to harpoon mark 3" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "swtich to harpoon mark 4" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>p", function() harpoon:list():prev() end, { desc = "prev harpoon mark" })
    vim.keymap.set("n", "<leader>n", function() harpoon:list():next() end, { desc = "next harpoon mark" })

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        }):find()
    end

    vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "open harpoon window" })
  end
}
