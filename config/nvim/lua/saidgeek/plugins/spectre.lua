return {
	"windwp/nvim-spectre",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	keys = {
		{ "<leader>s", ':lua require("spectre").open()<CR>' },
	},
	cmd = "Spectre",
	config = true,
}
