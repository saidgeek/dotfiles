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

-- reset lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>")

keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")
