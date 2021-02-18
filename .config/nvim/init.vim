"  _ ____   _(_)_ __ ___  
" | '_ \ \ / / | '_ ` _ \ 
" | | | \ V /| | | | | | |
" |_| |_|\_/ |_|_| |_| |_|
                        
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let mapleader = " "

"This thing is needed apparently to tell vim it it not vi
	set nocompatible

 "Enable syntax and plugins
    syntax enable
    filetype plugin on

 " Colorscheme thing
    colorscheme tucnak

" Find in subfolders
    set path+=**

" Display all matching files when tab complete
    set wildmenu

"vimrc stuff
    "Open vimrc in a new tab
        map <C-v> :tabnew ~/.config/nvim/init.vim<CR><CR>
    "Auto source vimrc after saving
        autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
        autocmd! bufwritepost ~/.config/nvim/init.vim

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
    set nonu nornu

    nnoremap <leader>n :call g:ToggleNuMode()<cr>

    function! g:ToggleNuMode()
        if &rnu == 1
            set nonu
            set nornu
        else
            set number relativenumber
        endif
    endfunction

"vim-plug
<<<<<<< HEAD
	" if empty(glob('~/.vim/autoload/plug.vim'))
	" 	silent !mkdir -p ~/.vim/autoload
	" 	silent !curl -fLo ~/.vim/autoload/plug.vim
	" 				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	" 	autocmd VimEnter * PlugInstall
	" endif 
    "
    " call plug#begin()
    "     Plug 'fatih/vim-go'
    "     Plug 'tomtom/tcomment_vim'
    "     Plug 'Raimondi/delimitMate'
    "     Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lock file'}
    " call plug#end()
    "
    " let delimitMate_expand_cr = 1
=======
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !mkdir -p ~/.vim/autoload
		silent !curl -fLo ~/.vim/autoload/plug.vim
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall
	endif 

    call plug#begin()
        Plug 'fatih/vim-go'
        Plug 'tomtom/tcomment_vim'
        Plug 'Raimondi/delimitMate'
    call plug#end()

    let delimitMate_expand_cr = 1
>>>>>>> origin/master

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
      noremap <buffer> <C-l> <C-w>l
  endfunction
	
	map <C-n> :call ToggleNetrw()<CR>
"Splits
    "Splits open bottom right
        set splitright splitbelow 

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
	"Compile and run Go
        map <leader>g :w <CR>:GoRun <CR>
	"Compile and run Java
        map <leader>j :w <CR> :!javac %  && clear && java %:r <CR>
	"Save and run python
        map <leader>p :w <CR> :!python % <CR>
	"Save and run sh
        map <leader>s :w <CR> :!%:p <CR>
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
  source ~/.config/nvim/scripts/statusbar.vim

    " Terminal mode mappings
      " Move between splits
      tnoremap <A-h> <C-\><C-N><C-w>h
      tnoremap <A-j> <C-\><C-N><C-w>j
      tnoremap <A-k> <C-\><C-N><C-w>k
      tnoremap <A-l> <C-\><C-N><C-w>l

      " ESC key bindings
      tnoremap <Esc> <C-\><C-n>
      tnoremap <M-[> <Esc>
      tnoremap <C-v><Esc> <Esc>
      
      " No line numbers for terminal buffers
      au TermOpen * setlocal listchars= nonumber norelativenumber
      au TermOpen * setlocal laststatus=0

      " Mouse support
      set mouse=a

      " Interactive find and replace
      set inccommand=nosplit
      nnoremap <Leader>k :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

      " Vim uses system clipboard
      set clipboard=unnamedplus
        
