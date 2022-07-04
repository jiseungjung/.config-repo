nnoremap <silent> <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent> <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <silent> <C-h> :lua require("harpoon.ui").nav_prev() <CR>
nnoremap <silent> <C-l> :lua require("harpoon.ui").nav_next()<CR>
