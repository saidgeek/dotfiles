return {
  "nvim-neorg/neorg",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  build = ":Neorg sync-parsers",
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/neorg/notes",
            },
            default_workspace = "notes",
          },
        },
      }
    }
  end
}
