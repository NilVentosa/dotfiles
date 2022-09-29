local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use {
      'nvim-telescope/telescope.nvim', 
      tag = '0.1.0',
      requires = { 
        {'nvim-lua/plenary.nvim'},
        {'BurntSushi/ripgrep'},
        {'nvim-telescope/telescope-fzy-native.nvim'},
        {'nvim-telescope/telescope-file-browser.nvim'}
      }
    }
    use 'tanvirtin/monokai.nvim'
    use 'neovim/nvim-lspconfig'
    use 'Raimondi/delimitMate'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'    
    use 'L3MON4D3/LuaSnip'
    use 'tomtom/tcomment_vim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'Mofiqul/dracula.nvim'
    use 'bash-lsp/bash-language-server'

    if packer_bootstrap then
        require('packer').sync()
    end
end)

