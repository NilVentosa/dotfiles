" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
" (_)_/ |_|_| |_| |_|_|  \___|

let mapleader = " "

"This thing is needed apparently
	set nocompatible

"To be able to delete with backspace
	set backspace=indent,eol,start

"Tab size thingie
	set tabstop=4
	set shiftwidth=4

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
	map <leader>p :!opout <c-r>%<CR><CR>
	"Move faster with j,k
	map <C-j> 5j
	map <C-k> 5k
                            
