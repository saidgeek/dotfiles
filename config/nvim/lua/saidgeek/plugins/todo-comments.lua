local ok, todo = pcall(require, "todo-comments")
if not ok then
	return
end

todo.setup()

vim.keymap.set("n", "<leader>t", "<cmd>TodoTelescope<CR>", { noremap = true, silent = true })
