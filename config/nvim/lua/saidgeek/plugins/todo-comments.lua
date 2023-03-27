return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = true,
	keys = {
		{ "<loader>t", ":TodoTelescope<CR>", { noremap = true, silent = true } },
	},
}
