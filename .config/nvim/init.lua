-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

require 'config.options'
require 'config.keymaps'
require 'config.autocmds'

-- [[ Install `lazy.nvim` plugin manager if not already installed ]]
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
-- To check the current status of your plugins, run :Lazy
--
-- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
-- Alternatively, use `config = function() ... end` for full control over the configuration.
--
-- Plugins can also be configured to run Lua code when they are loaded.
-- See :help autocmd-events
--
-- Plugins can specify dependencies.
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { import = 'plugins.mini' }, -- Collection of various small independent plugins/modules
  { import = 'plugins.oil' }, -- File explorer
  { import = 'plugins.snacks' }, -- A collection of small quality of life plugins for Neovim.
  { import = 'plugins.gitsigns' }, -- Adds git related signs to the gutter, as well as utilities for managing changes
  { import = 'plugins.which-key' }, -- Useful plugin to show you pending keymaps.
  { import = 'plugins.telescope' }, -- Fuzzy Finder (files, lsp, etc)
  { import = 'plugins.lsp' }, -- LSP Plugins
  { import = 'plugins.blink' }, -- Autocompletion
  { import = 'plugins.copilot' }, -- Github copliot
  'giuxtaposition/blink-cmp-copilot', -- Adds copilot suggestions as a source for saghen/blink.cmp
  { import = 'plugins.tokyonight' }, -- Colorscheme
  { import = 'plugins.todo-comments' }, -- Highlight todo, notes, etc in comments
  { import = 'plugins.nvim-treesitter' }, -- Highlight, edit, and navigate code
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
--  NOTE: Neovim only read modelines from the first 5 and last 5 lines of a file.
--
-- vim: ts=2 sts=2 sw=2 et
