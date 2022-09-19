local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.g.delimitMate_expand_cr = 1

return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'Mofiqul/dracula.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/vim-vsnip'
    -- use 'simrat39/rust-tools.nvim'
    use 'L3MON4D3/LuaSnip'
    use 'Raimondi/delimitMate'
    use 'tomtom/tcomment_vim'
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'
    use 'rust-lang/rust'

    if packer_bootstrap then
        require('packer').sync()
    end
end)

