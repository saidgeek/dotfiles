local set = require('utils').setPlug('startify_')

set('files_number', 5)
set('lists', {
  { type = 'dir', header = { '  Recent files in '..vim.fn.getcwd() }},
  { type = 'files', header = { '  Recents files' }},
  { type = 'sessions', header = { ' Sessions' }},
  { type = 'commands', header = { ' Commands' }},
})

set('commands', {
  { 'packer Install', ':PackerInstall' }
})
