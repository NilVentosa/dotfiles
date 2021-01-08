" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
" (_)_/ |_|_| |_| |_|_|  \___|

let mapleader = " "

"This thing is needed apparently to tell vim it it not vi
	set nocompatible

 "Enable syntax and plugins
    syntax enable
    filetype plugin on

 " Colorscheme thing
    colorscheme tucnak
    let &colorcolumn=join(range(104,999),',')

" Find in subfolders
    set path+=**

" Display all matching files when tab complete
    set wildmenu

"vimrc stuff
    "Open vimrc in a new tab
    " map <C-v> :tabnew ~/.vimrc<CR><CR>
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

"Netrw
	function! ToggleNetrw()
    if g:NetrwIsOpen
      let i = bufnr("$")
      while (i >= 1)
        if (getbufvar(i, "&filetype") == "netrw")
          silent exe "bwipeout " . i
        endif
        let i-=1
      endwhile
      let g:NetrwIsOpen=0
    else
      let g:NetrwIsOpen=1
      silent Lexplore
    endif
	endfunc

  function! OpenRight()
    :normal v
    let g:path=expand('%:p')
    :q!
    execute 'belowright vnew' g:path
    :normal <C-l>
  endfunction

  function! OpenBelow()
    :normal v
    let g:path=expand('%:p')
    :q!
    execute 'belowright new' g:path
    :normal <C-l>
  endfunction

  let g:NetrwIsOpen = 0
	let g:netrw_banner = 0
	let g:netrw_liststyle = 3
	let g:netrw_browse_split = 4
	let g:netrw_winsize = 15

  augroup netrw_mapping
      autocmd!
      autocmd filetype netrw call NetrwMapping()
  augroup END

  function! NetrwMapping()
      noremap <buffer> V :call OpenRight()<CR>
      noremap <buffer> H :call OpenBelow()<CR>
      noremap <buffer> <C-l> <C-w>
  endfunction
	
	map <C-n> :call ToggleNetrw()<CR>

"Splits
    "Splits open bottom right
        set splitright
        set splitbelow 

    "Splits movement
        map <C-h> <C-w>h
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-l> <C-w>l

      " Splits resizeing
        noremap <Up> <C-w>+
        noremap <Down> <C-w>-
        noremap <Left> <C-w><
        noremap <Right> <C-w>>

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
        map <leader>m :w <CR> :!pandoc -o thing.html % <CR> 
          \ :!surf -f thing.html <CR><CR> :!rm thing.html <CR><CR>

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

" Status bar
  if has('nvim')
    source ~/.vim/scripts/statusbar.vim
  endif

