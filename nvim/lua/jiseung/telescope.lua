local builtin = require('telescope.builtin')

-- Fallback to find_files if git_files can't find a .git directory
project_files = function()
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    require"telescope.builtin".git_files()
  else
    require"telescope.builtin".find_files()
  end
end

vim.keymap.set('n', '<C-p>', project_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
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
