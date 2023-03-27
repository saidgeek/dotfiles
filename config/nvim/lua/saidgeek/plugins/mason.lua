return {
	"williamboman/mason.nvim",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
		{ "jayp0521/mason-null-ls.nvim" },
	},
	keys = {
		{ "<leader>M", ":Mason<CR>", { silent = true } },
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_null_ls = require("mason-null-ls")

		mason.setup()

		mason_lspconfig.setup({
			-- find mor LSP Servers: https://github.com/williamboman/mason-lspconfig.nvim
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"astro",
				"emmet_ls",
				"jsonls",
				"remark_ls",
				"rust_analyzer",
				"svelte",
				"taplo",
			},
			automatic_installation = true,
		})

		mason_null_ls.setup({
			-- list of formatters & linters for mason to install
			ensure_installed = {
				"prettier", -- ts/js formatter
				"stylua", -- lua formatter
				"eslint_d", -- ts/js linter
				"jq",
				"markdownlint",
			},
			-- auto-install configured formatters & linters (with null-ls)
			automatic_installation = true,
		})
	end,
}
