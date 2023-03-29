return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	config = true,
	keys = {
		{ "<loader>t", ":TodoTelescope<CR>", { noremap = true, silent = true } },
	},
}
