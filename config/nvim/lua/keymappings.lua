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
map('n', '<leader>fe', ':Telescope file_browser<cr>', { silent = true })
map('n', '<leader>ft', ':TodoTelescope<cr>', { silent = true })

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true})
map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", {silent = true})
map("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", {silent = true})
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true})
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true})
map("n", "gR", "<cmd>Trouble lsp_references<cr>", {silent = true})

-- fast scroling
map("n", "<C-j>", "10<C-e>")
map("n", "<C-k>", "10<C-y>")

-- vimux
map("n", "<leader>rr", ":call VimuxPromptCommand()<cr>")
map("n", "<leader>RR", ":call VimuxRunLastCommand()<cr>", {silent = true})
map("n", "<leader>rq", ":call VimuxCloseRunner()<cr>", {silent = true})
