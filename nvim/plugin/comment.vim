map <C-_> :call ToggleComment()<CR>

function Comment()
  exe ":s@^@".g:Comment."@g"
  exe ":s@$@".g:EndComment."@g"
endfunction

function Uncomment()
  exe ":s@^".g:Comment."@@g"
  exe ":s@$".g:EndComment."@@g"
endfunction

au BufRead,BufNewFile *.inc,*.ihtml,*.html,*.tpl,*.class | let Comment="<!-- " | let EndComment=" -->"
au BufRead,BufNewFile *.sh,*.pl,*.tcl let Comment="#" | let EndComment=""
au BufRead,BufNewFile *.js,*.cc,*.php,*.cxx let Comment="\/\/" | let EndComment=""
au BufRead,BufNewFile *.c,*.h,*.css,*.scss let Comment="\/\*" | let EndComment="\*\/"

"function! Comment()
"    let ft = &filetype
"    if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
"        silent s/^/\#/
"    elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
"        silent s:^:\/\/\ :g
"    elseif ft == 'tex'
"        silent s:^:%:g
"    elseif ft == 'vim'
"        silent s:^:\":g
"    endif
"endfunction
"
"function! Uncomment()
"    let ft = &filetype
"    if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
"        silent s/^\#//
"    elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
"        silent s:^\/\/\ ::g
"    elseif ft == 'tex'
"        silent s:^%::g
"    elseif ft == 'vim'
"        silent s:^\"::g
"    endif
"endfunction

function! ToggleComment()
    try
        call Uncomment()
    catch
        call Comment()
    endtry
endfunction
