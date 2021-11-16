require('nvim-tree').setup {
  side =  'left',
  width = 40,
  ignore = {".git"}, 
  gitignore =  1,
  auto_open = 1,
  auto_close = 1,
  quit_on_open = 1,
  update_cwd = 0,
  group_empty = 1,
  lsp_diagnostics = 1.
  highlight_opened_files = 1,
  follow = 0,
  auto_ignore_ft = {"dashboard"},
  icon_padding = " ",
  show_icons: {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
  },
  icons = {
    default = "﬒",
    symlink = "",
    git = {
      unstaged = "",
      staged = "ﮒ",
      unmerged = "",
      renamed = "",
      untracked = ""
    },
    folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
    },
    lsp = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  }
}


