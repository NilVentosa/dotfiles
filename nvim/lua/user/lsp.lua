-- LSP
-- 
-- -- RUST

require 'lspconfig'.rust_analyzer.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        -- lsp stuff
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer=0})
        -- diagnostics stuff
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, {buffer=0})
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", {buffer=0})
        -- cargo
        vim.keymap.set("n", "<leader>rr", "<cmd>!cargo run<CR>", {buffer=0})
        vim.keymap.set("n", "<leader>rt", "<cmd>!cargo test<CR>", {buffer=0})
        vim.keymap.set("n", "<leader>rf", "<cmd>!cargo fmt<CR>", {buffer=0})
        vim.keymap.set("n", "<leader>rc", "<cmd>!cargo clippy<CR>", {buffer=0})
    end,
}

-- require'lspconfig'.bashls.setup{}

