local set = require('utils').setPlug('nvim_tree_')

set('gitignore', 1)
set('quit_on_open', 1)
set('group_empty', 1)
set('highlight_opened_files', 1)
set('auto_ignore_ft', {'dashboard'})
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
  },
})

require('nvim-tree').setup {
  view = {
    width = 30,
    height = 15,
    side = 'bottom',
    hide_root_folder = true,
  },
  gitignore =  1,
  quit_on_open = 1,
  group_empty = 1,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  highlight_opened_files = 1,
  follow = 0,
  auto_ignore_ft = {"dashboard"},
}


