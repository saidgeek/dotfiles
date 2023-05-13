return {
  "catppuccin/nvim",
  name = "catppuccin",
  event = "VeryLazy",
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
      integrations = {
        noice = true,
      }
    })
    
    vim.cmd.colorscheme("catppuccin")
  end
}
