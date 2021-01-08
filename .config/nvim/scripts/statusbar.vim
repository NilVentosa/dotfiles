" Status Bar
  " Define all the different modes
  let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'N·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \}
  " Functions
  function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
  endfunction

  function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  endfunction

  function! FileType(file)
    if a:file == ''
      return '-'
    else
      return tolower(a:file)
    endif
  endfunction

  function! ActiveLine()
    let statusline = ""
    let statusline.='%#StatusLine#'
    " Current mode
    let statusline.='%#StatusLineCyan# %{ModeCurrent()} '
    let statusline.='%#StatusLine#'
    " Current git branch
    let statusline.='%#StatusLineYellow# %{GitBranch()} '
    let statusline.='%#StatusLine#'
    "Right
    let statusline.='%='
    " File name
    let statusline.='%#StatusLineCyan# %f '
    let statusline.='%#StatusLine#'
    " Current file type
    let statusline.='%#StatusLineMagenta# .%{FileType(&filetype)} '
    let statusline.='%#StatusLine#'
    " Current line and column
    let statusline.='%#StatusLineCyan# Ln %l, Col %c '
    let statusline.='%#StatusLine#'
    return statusline
  endfunction

  function! InactiveLine()
    let statusline = ""
    " File name
    let statusline.='%#StatusLineNC# %f '
    let statusline.='%#StatusLineNC#'
    return statusline
  endfunction

  function! NERDLine()
    let statusline = ""
    let statusline.='%#StatusLineYellow#'
    let statusline.='NERDTree'
    " File name
    return statusline
  endfunction

  " Bar
  augroup Statusline
    autocmd!
    autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
    autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
    autocmd FileType nerdtree setlocal statusline=%!NERDLine()
  augroup END
  set laststatus=2
