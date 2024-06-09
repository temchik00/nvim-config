return {
  "temchik00/toggle-signature-help.nvim",
  lazy = true,
  config = function()
    require("toggle-signature").setup({
      close_events = {
        'BufHidden',
        'BufLeave',
        'ModeChanged',
      }
    })
  end
}
