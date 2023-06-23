return {
	"TimUntersberger/neogit",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	keys = {
		{ "<leader>gG", "<cmd>:Neogit<CR>" },
	},
	cmd = "Neogit",
	config = true,
}
