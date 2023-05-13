return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-telescope/telescope-ui-select.nvim",
	},
	event = "VeryLazy",
	keys = {
		{ "<leader>ff", ":Telescope find_files<cr>" },
		{ "<leader>fs", ":Telescope live_grep<cr>" },
		{ "<leader>fc", ":Telescope grep_string<cr>" },
		{ "<leader>fb", ":Telescope buffers<cr>" },
		{ "<leader>fh", ":Telescope help_tags<cr>" },
		{ "<leader>fe", ":Telescope file_browser<cr>" },
		{ "<leader>gc", ":Telescope git_commits<cr>" },
		{ "<leader>gfc", ":Telescope git_bcommits<cr>" },
		{ "<leader>gb", ":Telescope git_branches<cr>" },
		{ "<leader>gs", ":Telescope git_status<cr>" },
		{ "<leader><leader>k", ":Telescope keymaps<cr>" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"coverage",
					"dist",
					"build",
					"package-lock.json",
					"yarn-error.log",
				},
			},
			pickers = {
				find_files = {
					theme = "ivy",
				},
				live_grep = {
					theme = "ivy",
				},
				buffers = {
					theme = "ivy",
				},
				grep_string = {
					theme = "ivy",
				},
				help_tags = {
					theme = "ivy",
				},
				git_commits = {
					theme = "ivy",
				},
				git_bcommits = {
					theme = "ivy",
				},
				git_branches = {
					theme = "ivy",
				},
				git_status = {
					theme = "ivy",
				},
				keymaps = {
					theme = "ivy",
				},
			},
			extensions = {
				file_browser = {
					initial_mode = "normal",
					theme = "ivy",
				},
				["ui-select"] = {
					theme = "ivy",
				},
			},
		})
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("ui-select")
	end,
}
