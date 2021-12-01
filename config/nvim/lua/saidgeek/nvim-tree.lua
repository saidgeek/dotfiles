require('nvim-tree').setup {
  view = {
    width = 30,
    height = 15,
    side = 'bottom',
    hide_root_folder = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = ""
    }
  }
}

local set = require('utils').setPlug('nvim_tree_')

set('quit_on_open', 1)
set('group_empty', 1)
set('highlight_opened_files', 1)
set('icon_padding', ' ')
set('show_icons', {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
})

set('icons', {
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
  }
})


