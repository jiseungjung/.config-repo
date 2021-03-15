lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
