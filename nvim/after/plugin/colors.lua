require("tokyonight").setup({
  transparent = true,
  terminal_colors = true,
  styles = {
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = { "terminal", "help" },
})

vim.cmd.colorscheme('tokyonight')
