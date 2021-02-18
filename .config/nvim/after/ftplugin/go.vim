setlocal path=.,**,~/gogo/src/**
set wildignore=*.bat,*.bash
set suffixesadd=.go
set colorcolumn=0

set include=^\\s*"\\zs[^"]*

let g:go_gopls_enabled = 0

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

augroup completion_preview_close
  autocmd!
  autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
augroup END
