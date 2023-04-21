local utils = require("utils")

local setup_servers = function(lspconfig, on_attach, capabilities)
	local servers = {
		"html",
		"rust_analyzer",
		"astro",
		"svelte",
		"cssls",
		"tailwindcss",
	}

	---@diagnostic disable-next-line: unused-local
	for k, v in pairs(servers) do
		lspconfig[v].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end

	require("typescript").setup({
		server = {
			capabilities = capabilities,
			on_attach = on_attach,
		},
	})

	lspconfig["lua_ls"].setup({
		-- capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemerty = {
					enable = false,
				},
				hint = {
					enable = true,
				},
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "jose-elias-alvarez/typescript.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "williamboman/mason.nvim" },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local on_attach = function(client, bufnr)
			-- keybind options
			local opts = { buffer = bufnr }

			vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

			vim.keymap.set(
				"n",
				"gd",
				vim.lsp.buf.definition,
				utils.mergeTable(opts)({ desc = "Seach definitions into buffer" })
			) -- got to declaration
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set(
				"n",
				"gi",
				vim.lsp.buf.implementation,
				utils.mergeTable(opts)({ desc = "Go to implementation" })
			)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<space>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)

			-- typescript specific keymaps (e.g. rename file and update imports)
			if client.name == "tsserver" then
				vim.keymap.set(
					"n",
					"<leader>trf",
					":TypescriptRenameFile<CR>",
					utils.mergeTable(opts)({ desc = "Rename typescript file" })
				)
				vim.keymap.set(
					"n",
					"<leader>toi",
					":TypescriptOrganizeImports<CR>",
					utils.mergeTable(opts)({ desc = "Organize imports in typescript" })
				)
				vim.keymap.set(
					"n",
					"<leader>tru",
					":TypescriptRemoveUnused<CR>",
					utils.mergeTable(opts)({ desc = "Remove unusaed variables in typescript" })
				)
				vim.keymap.set(
					"n",
					"<leader>tai",
					":TypescriptAddMissingImports<CR>",
					utils.mergeTable(opts)({ desc = "Add missing imports in typecript" })
				)
			end
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config({ virtual_text = true })

		setup_servers(lspconfig, on_attach, capabilities)

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "single",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "single",
		})

		vim.diagnostic.config({
			float = {
				border = "single",
			},
		})
	end,
}
