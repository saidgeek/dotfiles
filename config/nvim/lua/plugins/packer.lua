local utils = require('utils')
local fn = utils.fn
local cmd = utils.cmd

-- install packer manager if is not installed

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  cmd 'packadd packer.nvim'
end

-- install plugins
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  
  -- utilities
  use 'glepnir/dashboard-nvim'
  use {
    'hoob3rt/lualine.nvim',
    reauires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  --[[ use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require('saidgeek.config.statusline') end,
    requires = {
      'kyazdani42/nvim-web-devicons', opt = true
    }
  }
  ]]
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
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
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
  use {
    'kyazdani42/nvim-tree.lua',
    commit = "fd7f60e242205ea9efc9649101c81a07d5f458bb",
  }
  -- Theme 
  use 'Shatur/neovim-ayu'
  use 'kyazdani42/nvim-web-devicons'
  
  -- LSP
  use 'neovim/nvim-lspconfig'

  -- LSP Utilities
  use 'glepnir/lspsaga.nvim'
  -- langs
  use 'folke/lua-dev.nvim'
end)
