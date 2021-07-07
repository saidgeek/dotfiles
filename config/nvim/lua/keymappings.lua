local map = require('utils').map

vim.g.mapleader = ' '

-- NvimTree

map('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })
map('n', '<leader>E', ':NvimTreeFind<CR>', { silent = true })

-- Bufferline
map('n', 'Q', ':bdelete<CR>', { silent = true })
map('n', 'H', ':BufferLineCycleNext<CR>', { silent = true })
map('n', 'L', ':BufferLineCyclePrev<CR>', { silent = true })
