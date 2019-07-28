let mapleader = " "

"This thing is needed apparently
set nocompatible

"To be able to delete with backspace
set backspace=indent,eol,start

"Tab size thingie
set tabstop=4
set shiftwidth=4

"Display line numbers
set relativenumber

"Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
"vim-plug
call plug#begin()
	Plug 'msanders/snipmate.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'tomtom/tcomment_vim'
	Plug 'pangloss/vim-javascript'
call plug#end()

filetype plugin on

"NERDtree
map <C-n> :NERDTreeToggle<CR>

"Tabs
map <C-t> :tabn<CR>

"Enable autocompletion
	set wildmode=longest,list,full

"Disable autocomment
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Splits open bottom right
	set splitbelow splitright

"Split navigation
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

"Open .html
map <leader>p :!opout <c-r>%<CR><CR>

"Display highlights
set hlsearch
hi Search ctermbg=Magenta
hi Search ctermfg=Black
