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
    "let &colorcolumn=join(range(104,105),',')

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
	set tabstop=4
	set shiftwidth=4
	set softtabstop=4
	set shiftround
	set expandtab

"Display line numbers
    set number relativenumber

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
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !mkdir -p ~/.vim/autoload
		silent !curl -fLo ~/.vim/autoload/plug.vim
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall
	endif 
" VimPlugged 
call plug#begin()
    Plug 'fatih/vim-go'
    Plug 'scrooloose/nerdtree'
    Plug 'tomtom/tcomment_vim'
    Plug 'Raimondi/delimitMate'
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lock file'}
call plug#end()

  let delimitMate_expand_cr = 1

"Enable autocompletion
	set wildmode=longest,list,full

"Disable autocomment
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Display highlights
	set hlsearch

"NerdTree
	map <C-n> :NERDTreeToggle<CR>
  let g:NERDTreeWinSize=40
  let NERDTreeQuitOnOpen=1

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
  source ~/.vim/scripts/statusbar.vim

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
        
" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
