require("saidgeek.core.options")

vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
  pattern = "VeryLazy",
  callback = function()
    require("saidgeek.core.keymaps")
    require("saidgeek.core.colorscheme")
  end,
})

require('config.lazy')
