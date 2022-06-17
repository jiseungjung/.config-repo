nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>ps <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
