require("saidgeek.core.options")

-- FIXME: see why the theme load retarded
vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
	pattern = "VeryLazy",
	callback = function()
		require("saidgeek.core.keymaps")
	end,
})

require("config.lazy")
