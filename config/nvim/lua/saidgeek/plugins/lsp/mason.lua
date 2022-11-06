local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end


local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

mason.setup()

mason_lspconfig.setup({
  -- find mor LSP Servers: https://github.com/williamboman/mason-lspconfig.nvim
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "tailwindcss",
    "sumneko_lua",
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
    "alex",
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})
