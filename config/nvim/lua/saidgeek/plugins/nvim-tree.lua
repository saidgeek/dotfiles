return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<leader>e", ":NvimTreeToggle<CR>" },
	},
	cmd = "NvimTreeToggle",
	config = function()
		require("nvim-tree").setup({
			disable_netrw = true,
			view = {
				adaptive_size = true,
				width = 40,
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
