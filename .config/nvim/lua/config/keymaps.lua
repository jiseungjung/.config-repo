-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Escape terminal insert mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Escape Terminal Insert Mode' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>d', function()
  vim.diagnostic.open_float(nil, {
    scope = 'cursor',
    focus = false,
  })
end, { desc = 'Show diagnostic under cursor' })

-- Open Oil
vim.keymap.set('n', '-', ':Oil<CR>', { desc = 'Open parent directory' })

-- Keymaps to open Oil in a split window
vim.keymap.set('n', '<leader>el', function()
  vim.cmd.vsplit()
  require('oil').open()
end, { desc = 'Open Oil to the right' })

vim.keymap.set('n', '<leader>ej', function()
  vim.cmd.split()
  require('oil').open()
end, { desc = 'Open Oil below' })

vim.keymap.set('n', '<leader>eh', function()
  vim.opt.splitright = false
  vim.cmd.vsplit()
  require('oil').open()
  vim.opt.splitright = true
end, { desc = 'Open Oil to the left' })

vim.keymap.set('n', '<leader>ek', function()
  vim.opt.splitbelow = false
  vim.cmd.split()
  require('oil').open()
  vim.opt.splitbelow = true
end, { desc = 'Open Oil above' })

-- Keymaps to split window
vim.keymap.set('n', '<leader>wl', function()
  vim.cmd 'vsplit'
end, { desc = 'Open window to the right' })

vim.keymap.set('n', '<leader>wj', function()
  vim.cmd 'split'
end, { desc = 'Open window below' })

vim.keymap.set('n', '<leader>wh', function()
  vim.opt.splitright = false
  vim.cmd 'vsplit'
  vim.opt.splitright = true
end, { desc = 'Open window to the left' })

vim.keymap.set('n', '<leader>wk', function()
  vim.opt.splitbelow = false
  vim.cmd 'split'
  vim.opt.splitbelow = true
end, { desc = 'Open window above' })

-- Keymaps to open terminal
vim.keymap.set('n', '<leader>tl', function()
  vim.cmd 'vsplit | terminal'
end, { desc = 'Open terminal to the right' })

vim.keymap.set('n', '<leader>tj', function()
  vim.cmd 'split | terminal'
end, { desc = 'Open terminal below' })

vim.keymap.set('n', '<leader>th', function()
  vim.opt.splitright = false
  vim.cmd 'vsplit | terminal'
  vim.opt.splitright = true
end, { desc = 'Open terminal to the left' })

vim.keymap.set('n', '<leader>tk', function()
  vim.opt.splitbelow = false
  vim.cmd 'split | terminal'
  vim.opt.splitbelow = true
end, { desc = 'Open terminal above' })

-- Keymaps to make split navigation easier
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Go to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Go to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Go to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Go to the upper window' })

-- When in terminal mode, Ctrl-h/l/j/k will move between windows
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { noremap = true, silent = true, desc = 'Go to the left window from terminal' })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { noremap = true, silent = true, desc = 'Go to the right window from terminal' })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { noremap = true, silent = true, desc = 'Go to the lower window from terminal' })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { noremap = true, silent = true, desc = 'Go to the upper window from terminal' })
