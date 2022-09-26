-- KEYMAPPING

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- Move
keymap('n', '<c-u>', '10k',{})
keymap('n', '<c-d>', '10j',{})

-- Open file under cursor in vertical split
keymap('n', 'gs', ':vertical wincmd f<CR>', {})

-- JSON formatting
keymap('n', '<leader>j', ':%!jq .<CR>', {})

-- NETRW
keymap('n', '<C-n>', ':call ToggleNetrw()<CR>', {})

-- Telescope
keymap("n", "<leader><leader>", "<cmd>Telescope find_files<CR>", {})

-- Highlights
keymap("n", "<leader>h", "<cmd>noh<CR>", {})
