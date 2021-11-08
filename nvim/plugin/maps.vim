" copy and paste
vnoremap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
inoremap <C-v> :r ~/.vimbuffer<CR>

" find highlighted
vnoremap <C-f> y/\V<C-R>=escape(@",'/\')<CR><CR>
