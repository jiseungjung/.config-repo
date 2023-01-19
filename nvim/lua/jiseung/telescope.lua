local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})

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
