" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
" (_)_/ |_|_| |_| |_|_|  \___|

let mapleader = " "

"This thing is needed apparently
	set nocompatible
"vimrc stuff
    "Open vimrc in a new tab
    map <C-v> :tabnew ~/.vimrc<CR><CR>
    "Auto source vimrc after saving
    autocmd! bufwritepost ~/.vimrc source ~/.vimrc

"Copy pase
	set pastetoggle=<F2>
	set clipboard=unnamed

"To be able to delete with backspace
	set backspace=indent,eol,start

"Tab size thingie
	set tabstop=4
	set shiftwidth=4
	set softtabstop=4
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
		Plug 'msanders/snipmate.vim'
		Plug 'scrooloose/nerdtree'
		Plug 'tomtom/tcomment_vim'
		Plug 'pangloss/vim-javascript'
        Plug 'dracula/vim', { 'as': 'dracula' }
		Plug 'Raimondi/delimitMate'
        Plug 'cespare/vim-toml'
	call plug#end()

	filetype plugin on
    let delimitMate_expand_cr = 1

"Enable autocompletion
	set wildmode=longest,list,full

"Disable autocomment
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Display highlights
	set hlsearch

 "Syntax and color scheme
    syntax on
    colorscheme dracula

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
	"Save and run python
        map <leader>p :w <CR> :!python % <CR>

"Faster movement
    map J 5j
    map K 5k
    map L E
    map H B

"Autohighlight
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
