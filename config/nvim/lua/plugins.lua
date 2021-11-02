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
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use { 'nvim-lua/popup.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- navigation
    use { 'TimUntersberger/neofs', requires = 'kyazdani42/nvim-web-devicons' }


    -- Theme 
    use 'Shatur/neovim-ayu'
    use 'kyazdani42/nvim-web-devicons'
    
    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'

    -- langs
    use 'folke/lua-dev.nvim'

    -- dev utils
    use "tyewang/vimux-jest-test"

    -- general
    use 'airblade/vim-rooter'
  end
)
