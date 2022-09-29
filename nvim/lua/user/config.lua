-- CONFIG
--

-- Options
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4 
vim.opt.softtabstop = 4
vim.opt.laststatus = 3 -- Only one statusbar
vim.opt.rnu = true -- Relative number
vim.opt.nu = true -- Line number
vim.opt.scrolloff = 5
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest,list,full'
vim.opt.splitright = true  -- Default splits right
vim.opt.splitbelow = true  -- Default splits below
vim.opt.hlsearch = true -- Highlight search
vim.opt.incsearch = true
vim.opt.updatetime = 300
vim.opt.cursorline = true -- Show cursor line
vim.opt.foldenable = false -- Disable folding
vim.opt.autowriteall = true -- Save automatically
vim.opt.swapfile = false -- No swap files
vim.opt.path = '.,**'
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt={"menu","menuone","noselect"}

-- Color
vim.cmd[[colorscheme dracula]]

--
vim.cmd[[syntax enable]]
vim.cmd[[filetype plugin indent on]]

-- From plugins
vim.g.delimitMate_expand_cr = 1
