-- LSP

require 'lspconfig'.rust_analyzer.setup{
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    end,
}
