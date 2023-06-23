return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("todo-comments").setup({})
	end,
	event = "VeryLazy",
	keys = {
		{ "<leader>t", ":TodoTelescope<cr>", desc = "Find TODOS!", silent = true },
	},
}
