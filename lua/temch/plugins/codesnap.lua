return {
  "mistricky/codesnap.nvim",
  build="make",
  lazy=true,
  cmd={"CodeSnap", "CodeSnapSave"},
  opts = {
    has_breadcrumbs = true,
    show_workspace = true,
    has_line_number = true,
  }
}
