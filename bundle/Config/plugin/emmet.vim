"let g:user_emmet_mode='i'    "only enable normal mode functions.
"let g:user_emmet_mode='inv'  "enable all functions, which is equal to
"let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim/.snippets_custom.json')), "\n"))
