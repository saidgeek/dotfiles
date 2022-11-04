local status, nvimtree = pcall(require, "nvim-tree")
if not status then
  return
end

vim.g.loader_netrw = 1
vim.g.loader_netrwPlugin = 1

nvimtree.setup({
  disable_netrw = true,
  view = {
    adaptive_size = true,
    width = 50,
    side = "right",
  },
  renderer = {
    highlight_opened_files = "all",
    indent_markers = {
      enable = true
    },
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          untracked = "",
        },
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  }
})
