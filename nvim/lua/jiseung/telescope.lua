require'telescope'.setup {
  defaults = {
    path_display = {'truncate'}
  },
  pickers = {
    live_grep = {
      layout_strategy = "vertical",
      layout_config = {
        height = 0.95,
        preview_cutoff = 1
      },
    }
  },
}
