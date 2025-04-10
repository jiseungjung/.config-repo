require("tokyonight").setup({
  transparent = true,
  terminal_colors = true,
  style = "storm",
  styles = {
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = { "terminal", "help" },
})

vim.cmd.colorscheme('tokyonight')
