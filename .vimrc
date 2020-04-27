" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
" (_)_/ |_|_| |_| |_|_|  \___|

let mapleader = " "

"This thing is needed apparently to tell vim it it not vi
	set nocompatible

 "Enable syntax and plugins
    syntax enable
    colorscheme tucnak
	filetype plugin on

" Find in subfolders
    set path+=**

" Display all matching files when tab complete
    set wildmenu

"vimrc stuff
    "Open vimrc in a new tab
    map <C-v> :tabnew ~/.vimrc<CR><CR>
    "Auto source vimrc after saving
    autocmd! bufwritepost ~/repos/dotfiles/.vimrc source ~/repos/dotfiles/.vimrc
    autocmd! bufwritepost ~/.vimrc source ~/.vimrc

"Copy pase
	set pastetoggle=<F2>
	set clipboard=unnamed

"To be able to delete with backspace
	set backspace=indent,eol,start

"Tab size thingie
	set tabstop=2
	set shiftwidth=2
	set softtabstop=2
	set shiftround
	set expandtab

"Display line numbers
	set number relativenumber

"vim-plug
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !mkdir -p ~/.vim/autoload
		silent !curl -fLo ~/.vim/autoload/plug.vim
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall
	endif 
	call plug#begin()
		Plug 'scrooloose/nerdtree'
		Plug 'tomtom/tcomment_vim'
		Plug 'Raimondi/delimitMate'
    Plug 'cespare/vim-toml'
	call plug#end()

    let delimitMate_expand_cr = 1

"Enable autocompletion
	set wildmode=longest,list,full

"Disable autocomment
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Display highlights
	set hlsearch

"NerdTree
	"NerdTree toggle
	map <C-n> :NERDTreeToggle<CR>
    "Size
    let g:NERDTreeWinSize=40

"Splits
    "Splits open bottom right
        set splitright
        set splitbelow 

    "Splits movement
        map <C-h> <C-w>h
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-l> <C-w>l

"Tabs
    "Move to next tab
        map <C-t> :tabnext<cr>

"Compile
	"Compile and run C
        map <leader>c :w <CR> :!gcc % -o compiled/%< && clear && ./compiled/%< <CR>
	"Compile and run Java
        map <leader>j :w <CR> :!javac %  && clear && java %:r <CR>
	"Save and run python
        map <leader>p :w <CR> :!python % <CR>
    "Compile md and open in surf
        map <leader>m :w <CR> :!pandoc -o thing.html % <CR> :!surf -f thing.html <CR><CR> :!rm thing.html <CR><CR>

"Faster movement
    map J 5j
    map K 5k
    map L 5l
    map H 5h

"Tags
    nnoremap <leader>t :w <CR> :!ctags -R .<CR><CR>
    nnoremap <C-M> <C-]>

"Autohighlight all instances of current word
    set updatetime=300
    function! HighlightWordUnderCursor()
        if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]' 
            exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/' 
        else 
            match none 
        endif
    endfunction
    autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()

"Cursorline
    set cursorline
    hi cursorline cterm=none term=none
    autocmd WinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline

"Disable folding
    set nofoldenable

"Display the highlight groups of the word under cursor
nmap <leader>h :call SynStack()<CR>
function! SynStack()
    if !exists('*synstack')
        return
    endif
    echo map(synstack(line('.'),col('.')), "synIDattr(v:val, 'name')")
endfunc

"Java maps
    "ab sout System.out.prinln();<esc>hi

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
