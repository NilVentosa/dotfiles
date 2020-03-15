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
