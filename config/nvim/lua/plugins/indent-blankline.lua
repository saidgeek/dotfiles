local set = require('utils').setPlug('indent_blankline_')

set('char', '│')
set('space_char', '·')
set('filetype_exclude', {
  'help',
  'markdown',
  'text',
  'rst',
  'man',
  'startify',
  'dashboard',
  'tsplayground'
})

