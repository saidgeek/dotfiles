return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<leader>p", ":NvimTreeToggle<CR>" },
	},
	cmd = "NvimTreeToggle",
	config = function()
		require("nvimtree").setup({
			disable_netrw = true,
			view = {
				adaptive_size = true,
				width = 50,
				side = "right",
			},
			renderer = {
				highlight_opened_files = "all",
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						git = {
							unstaged = "",
							staged = "",
							untracked = "",
						},
					},
				},
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		})
	end,
}
