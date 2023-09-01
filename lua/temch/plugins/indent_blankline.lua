return {
  "lukas-reineke/indent-blankline.nvim",
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    show_end_of_line = true,
    show_current_context = true,
  }
}
