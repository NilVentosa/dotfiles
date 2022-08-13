local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- Save
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

-- Move
keymap('n', '<c-u>', '10k',{})
keymap('n', '<c-d>', '10j',{})

-- Move in insert mode
keymap('i', '<c-h>', '<Left>', {})
keymap('i', '<c-j>', '<Down>', {})
keymap('i', '<c-k>', '<Up>', {})
keymap('i', '<c-l>', '<Right>', {})

-- Open file in vertical split
keymap('n', 'gs', ':vertical wincmd f<CR>', {})

-- JSON formatting
keymap('n', '<leader>j', ':%!jq .<CR>', {})

-- NETRW
keymap('n', '<C-n>', ':call ToggleNetrw()<CR>', {})

