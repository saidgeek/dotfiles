vim.g.mapleader = " "

local keymap = vim.keymap

-- use kjkj to exit insert mode
keymap.set("i", "kjkj", "<ESC>")

-- maximize current window
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>")

-- window manager
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- file explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>")
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")

-- neogit
keymap.set("n", "<leader>gg", "<cmd>:Neogit<CR>")

-- reset lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>")
