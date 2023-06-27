local ok, lsp = pcall(require, "lspconfig")

if not ok then
  return
end

local M = {}

M.setup = function(opts)
  
  lsp.rust_analyzer.setup {
    on_attach = opts.on_attach,
    capabilities = opts.capabilities,
    cmd = {
      "rustup", "run", "stable", "rust-analyzer"
    },
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          enable = true,
        },
      },
    },
  }
end

return M
