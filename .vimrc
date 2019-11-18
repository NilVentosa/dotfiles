" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
" (_)_/ |_|_| |_| |_|_|  \___|

let mapleader = " "

"This thing is needed apparently
	set nocompatible

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
		Plug 'Raimondi/delimitMate'
        Plug 'tpope/vim-fugitive'
        Plug 'cespare/vim-toml'
	call plug#end()

	filetype plugin on


"Enable autocompletion
	set wildmode=longest,list,full

"Disable autocomment
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Splits open bottom right
	set splitbelow splitright

"Display highlights
	set hlsearch
	hi Search ctermbg=Magenta
	hi Search ctermfg=Black


"Mappings
	"NerdTree toggle
	map <C-n> :NERDTreeToggle<CR>
	"Mappings to move around windows
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
	"Open .html in firefox
	map <leader>h :!opout <c-r>%<CR><CR>
	"Compile and run C
	map <leader>c :w <CR> :!gcc % -o compiled/%< && clear && ./compiled/%< <CR>
	"Save and run python
	map <leader>p :w <CR> :!python3 % <CR>

let delimitMate_expand_cr = 1
filetype indent plugin on

