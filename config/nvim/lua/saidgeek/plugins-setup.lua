-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])

    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

-- install packages whe this file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim")
  use("christoomey/vim-tmux-navigator") -- add shortcuts for jump into splits
  use("szw/vim-maximizer") -- maximize current window

  -- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("numToStr/Comment.nvim")

  -- colorschema
  use ({ 'projekt0n/github-nvim-theme' })

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- icons
  use("kyazdani42/nvim-web-devicons")

  -- statusline
	use("nvim-lualine/lualine.nvim")

  -- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

  if packer_bootstrap then
    require("packer").sync()
  end
end)

