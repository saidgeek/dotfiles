return {
	"nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
	keys = {
		{ "<leader>e", ":NvimTreeToggle<CR>", desc = "NvimTree", silent = true },
	},
	config = function()
		require("nvim-tree").setup({
			disable_netrw = true,
			view = {
				adaptive_size = true,
				width = 45,
				side = "left",
			},
			renderer = {
				highlight_opened_files = "all",
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
            -- TODO: change icons!
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
