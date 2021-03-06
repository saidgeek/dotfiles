--[[  install packer manager if is not installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
 cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
 cmd 'packadd packer.nvim'
end
]]

-- install plugins
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
  function()
    use 'wbthomason/packer.nvim'
    
    -- utilities
    use {
      'hoob3rt/lualine.nvim',
      reauires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use "ahmedkhalf/lsp-rooter.nvim"
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim"
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    }
    use "preservim/vimux"

    -- Editor utilities
    use "lukas-reineke/indent-blankline.nvim"
    use 'windwp/nvim-autopairs'
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }
    use 'hrsh7th/nvim-compe'
    use { 
      'TimUntersberger/neogit',
      requires = 'nvim-lua/plenary.nvim',
      commit = "53772efc42263989d18d4a86c350b8b0e1f1b71b",
    }
    use { 'nvim-lua/popup.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'b3nj5m1n/kommentary'

    -- navigation
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
    }

    -- Theme 
    -- use 'Shatur/neovim-ayu'
    use {'dracula/vim', as = 'dracula'}
    use 'kyazdani42/nvim-web-devicons'
    
    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'tami5/lspsaga.nvim'

    -- langs
    use 'folke/lua-dev.nvim'
    use 'simrat39/rust-tools.nvim'

    -- dev utils
    use "tyewang/vimux-jest-test"

    -- general
    use 'airblade/vim-rooter'
  end
)
