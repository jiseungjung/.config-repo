" copy and paste for WSL
" vnoremap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
" inoremap <C-v> :r ~/.vimbuffer<CR>

" source init.vim
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
