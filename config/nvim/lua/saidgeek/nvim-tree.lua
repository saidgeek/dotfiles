local set = require('utils').setPlug('nvim_tree_')

set('side', 'left')
set('width', 40)
set('ignore', {'.git'})
set('gitignore', 1)
set('auto_open', 1)
set('auto_close', 1)
set('quit_on_open', 1)
set('update_cwd', 0)
set('group_empty', 1)
set('lsp_diagnostics', 1)
set('highlight_opened_files', 1)
set('follow', 0)
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
  lsp = {
    hint = "",
    info = "",
    warning = "",
    error = "",
  }
})