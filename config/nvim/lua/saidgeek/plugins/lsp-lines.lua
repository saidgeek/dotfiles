return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	keys = {
		{
			"<leader>l",
			function()
				require("lsp_lines").toggle
			end,
			mode = "n",
			desc = "Toggle lsp lines",
		},
	},
	config = true,
}
