local g = vim.g;
local set = vim.opt;

set.title = true
set.mouse = ''
set.hidden = true
set.colorcolumn = '120'
set.scrolloff = 3
set.diffopt:append('vertical')
set.spelllang = {'en', 'es'}
set.showmode = true
set.swapfile = false
set.wrap = true
set.js = true
set.number = true
set.relativenumber = true
set.cursorline = true
set.clipboard = [[unnamed,unnamedplus]]

-- [[ folding config
set.foldenable = true
set.foldmethod = 'expr'
set.foldexpr = vim.fn['nvim_treesitter#foldexpr']()
set.foldnestmax = 3
set.foldlevel = 1
-- ]]

-- [[ tabs general config
set.tabstop = 2
set.shiftwidth = 2 
set.softtabstop = 2
set.shiftround = true
set.expandtab = true
-- ]]

set.ignorecase = true
set.smartcase = true
set.gdefault = true
set.inccommand = 'nosplit'

-- [[ theme
set.guifont = 'Victor Mono 10'
set.termguicolors = true
-- set.background = 'dark'
vim.cmd(':colorscheme dracula')
-- ]]

require('plugins')
-- require('saidgeek.ayu')
require('saidgeek.lualine')
require('saidgeek.nvim-tree')
require('saidgeek.indent-blankline')
require('saidgeek.autopairs')
require('saidgeek.nvim-treesitter')
require('saidgeek.lspsaga')
require('saidgeek.neogit')
require('saidgeek.todo-comments')
require('saidgeek.telescope')
require('saidgeek.kommentary')
-- require('saidgeek.gitsigns')
require('saidgeek.vimux')
require('saidgeek.vim-rooter')
require('maps')
require('lsp_config')
require('saidgeek.nvim-compe')
