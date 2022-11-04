vim.g.mapleader = " "

local keymap = vim.keymap


-- file explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
