local set = require('utils').setPlug('nvim_tree_')

set('side', 'left')
set('width', 40)
set('ignore', {'.git'})
set('gitignore', 1)
set('auto_open', 1)
set('auto_close', 1)
set('quit_on_open', 1)
set('update_cwd', 0)
set('auto_ignore_ft', {'startify'})
set('icon_padding', ' ')
set('show_icons', {
  git = 1,
  folders = 1,
  files = 1,
})

set('icons', {
  default = "﬒",
  symlink = "",
  git = {
    unstaged = "",
    staged = "ﮒ",
    unmerged = "",
    renamed = "",
    untracked = ""
  },
  folder = {default = "", open = ""}
})
