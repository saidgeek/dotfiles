local map = require('utils').map

vim.g.mapleader = ' '

-- NvimTree

map('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })
map('n', '<leader>E', ':NvimTreeFind<CR>', { silent = true })

-- Bufferline
map('n', 'Q', ':bdelete<CR>', { silent = true })
map('n', 'H', ':BufferLineCycleNext<CR>', { silent = true })
map('n', 'L', ':BufferLineCyclePrev<CR>', { silent = true })

-- Neogit
map('n', '<leader>gs', ':Neogit<CR>', { silent = true })

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<cr>', { silent = true })
map('n', '<leader>fg', ':Telescope live_grep<cr>', { silent = true })
map('n', '<leader>fb', ':Telescope buffers<cr>', { silent = true })
map('n', '<leader>fh', ':Telescope help_tags<cr>', { silent = true })
map('n', '<leader>fb', ':Telescope file_browser<cr>', { silent = true })
