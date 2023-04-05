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
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"glepnir/lspsaga.nvim",
			branch = "main",
			config = function()
				require("lspsaga").setup({
					move_in_saga = { prev = "<C-p>", next = "<C-n>" },
					finder_action_keys = {
						open = "<CR>",
					},
					definition_action_keys = {
						edit = "<CR>",
					},
				})
			end,
		},
		{ "jose-elias-alvarez/typescript.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "williamboman/mason.nvim" },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local on_attach = function(client, bufnr)
			-- keybind options
			local opts = { noremap = true, silent = true, buffer = bufnr }

			-- set keybinds
			vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
			vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
			vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
			vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
			vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
			vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
			vim.keymap.set("n", "<C-k>", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
			vim.keymap.set("n", "K", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
			vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
			vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
			vim.keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

			-- typescript specific keymaps (e.g. rename file and update imports)
			if client.name == "tsserver" then
				vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
				vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
				vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
			end
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config({ virtual_text = false })

		setup_servers(lspconfig, on_attach, capabilities)
	end,
}
